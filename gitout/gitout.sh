#!/bin/bash
# By Bryan Wilcutt
# bwilcutt@yahoo.com
# PUBLIC DOMAIN, FREE FOR ALL
# Mar 2nd, 2022
# GitOut! - GitLab Artifact Cleanup
# Usage: ./gitout.sh [-p pid] [-a | -f | -d days | -l]
# GIT_URL and GIT_TOKEN must be exported from your ~/.bashrc
# e.g.:
#   export GIT_URL="https://gitlab.com"
#   export GIT_TOKEN="your_personal_access_token"
# Force yad to use X11/XWayland backend (prevents GDK_CRITICAL errors under Wayland)
export GDK_BACKEND=x11

# Win sizes
W_MAX="640x480"
W_SUB="320x480"
# FIX #7: Removed unused W_POP variable

usage() {
    cat <<EOF
GitOut! - GitLab Artifact Manager
Usage: $(basename "$0") [options]
  -p ID       Project ID (req. for CLI)
  -a          Delete ALL artifacts
  -f          Delete FAILED job artifacts
  -d DAYS     Delete artifacts older than X days
  -l          List jobs and exit
  -h, --help  Show this menu
Example: ./gitout.sh -p 12345 -d 30
Running with no options launches the UI.
EOF
    exit 0
}

# Make sure GITLAB_TOKEN has been defined.
verify() {
    for c in jq curl yad; do
        command -v $c >/dev/null || { echo "Install $c first."; exit 1; }
    done
    [[ -z "$GIT_TOKEN" ]] && { echo "GIT_TOKEN is not set. Add 'export GIT_TOKEN=...' to your ~/.bashrc."; exit 1; }
    [[ -z "$GIT_URL" ]]   && { echo "GIT_URL is not set. Add 'export GIT_URL=...' to your ~/.bashrc."; exit 1; }
    # GUI mode requires a display; skip check if running CLI-only flags
    if [[ -z "$c_pid" && -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
        echo "No display found. Start an X/Wayland session or use CLI flags (-p, -a, etc.)."
        exit 1
    fi
}

# FIX #2: Cross-platform date calculation (Linux + macOS)
days_ago() {
    local days=$1
    if date --version >/dev/null 2>&1; then
        # GNU coreutils (Linux)
        date -u -d "$days days ago" +"%Y-%m-%dT%H:%M:%SZ"
    else
        # BSD date (macOS)
        date -u -v-"${days}"d +"%Y-%m-%dT%H:%M:%SZ"
    fi
}

# FIX #1: Paginate through all results instead of capping at 100
fetch_all_pages() {
    local endpoint=$1 page=1 chunk result="[]"
    while :; do
        chunk=$(curl -s --header @<(printf 'PRIVATE-TOKEN: %s' "$GIT_TOKEN") \
            "${endpoint}$(echo "$endpoint" | grep -q '?' && echo '&' || echo '?')per_page=100&page=$page")
        # Stop if we get an empty array or a non-array (error)
        if ! echo "$chunk" | jq -e 'if type == "array" and length > 0 then . else error end' > /dev/null 2>&1; then
            break
        fi
        result=$(printf '%s\n%s' "$result" "$chunk" | jq -s 'add')
        ((page++))
    done
    echo "$result"
}

# FIX #5 & #6: Token passed via process substitution (not visible in ps),
#              and API responses validated before use.
curl_auth() {
    curl -s --header @<(printf 'PRIVATE-TOKEN: %s' "$GIT_TOKEN") "$@"
}

curl_auth_delete() {
    curl -X DELETE -s --header @<(printf 'PRIVATE-TOKEN: %s' "$GIT_TOKEN") "$@"
}

validate_jobs_response() {
    local jobs=$1 context=${2:-"API"}
    if ! echo "$jobs" | jq -e 'if type == "array" then . else error end' > /dev/null 2>&1; then
        local msg
        msg=$(echo "$jobs" | jq -r '.message // .error // "Unknown error"' 2>/dev/null || echo "$jobs")
        echo "$context error: $msg" >&2
        return 1
    fi
    return 0
}

do_cli() {
    local pid=$1 mode=$2 val=$3 ids=""
    local jobs
    jobs=$(fetch_all_pages "$GIT_URL/api/v4/projects/$pid/jobs")

    # FIX #6: Validate API response before proceeding
    validate_jobs_response "$jobs" "Jobs API" || exit 1

    case $mode in
        list)
            echo "$jobs" | jq -r 'sort_by(.status) | .[] | "\(.status)\t\(.id)\t\(.name)"' | column -t
            exit 0 ;;
        all)
            ids=$(echo "$jobs" | jq -r '.[] | select(.artifacts_file != null) | .id') ;;
        failed)
            ids=$(echo "$jobs" | jq -r '.[] | select(.artifacts_file != null and .status == "failed") | .id') ;;
        days)
            # FIX #2: Use cross-platform days_ago helper
            local cutoff
            cutoff=$(days_ago "$val")
            ids=$(echo "$jobs" | jq -r --arg c "$cutoff" '.[] | select(.artifacts_file != null and .created_at < $c) | .id') ;;
    esac

    for id in $ids; do
        curl_auth_delete "$GIT_URL/api/v4/projects/$pid/jobs/$id/artifacts"
        echo "Deleted: $id"
    done
    exit 0
}

do_gui() {
    # FIX #3: Capture spinner PID and kill it on exit (prevents orphaned windows)
    local yad_spinner_pid
    (echo "0"; echo "# Fetching projects...") | yad --progress --title="GitOut!" --pulsate --auto-close --no-cancel --width=300 &
    yad_spinner_pid=$!
    trap 'kill "$yad_spinner_pid" 2>/dev/null' EXIT

    local raw
    raw=$(fetch_all_pages "$GIT_URL/api/v4/projects?membership=true&statistics=true&min_access_level=40")

    kill "$yad_spinner_pid" 2>/dev/null
    trap - EXIT

    # FIX #6: Validate project list response
    if ! echo "$raw" | jq -e 'if type == "array" then . else error end' > /dev/null 2>&1; then
        yad --error --text="API Error. Check GIT_TOKEN and GIT_URL."
        exit 1
    fi
    if ! echo "$raw" | jq -e 'if length > 0 then . else error end' > /dev/null 2>&1; then
        yad --info --title="Rut Roh!" --text="No projects found with artifacts."
        exit 0
    fi

    # FIX #8: Build list safely without echo -e on untrusted project names
    local p_list
    p_list=$(echo "$raw" | jq -r '.[] | select(.statistics.job_artifacts_size > 0) | "\(.id)\n\(.path_with_namespace)\n\(.statistics.job_artifacts_size / 1024 / 1024 | floor) MB"' | sed '/^$/d')

    while true; do
        local pick pid
        # FIX #8: Use printf instead of echo -e to avoid interpreting escape sequences
        pick=$(printf '%s\n' "$p_list" | yad --list --title="GitOut!" --column="ID" --column="Project" --column="Size" \
            --search-column=2 --geometry=$W_MAX --text="Select a project:" --button="Exit:1" --button="Go!:0")

        [[ $? -ne 0 || -z "$pick" ]] && exit 0
        pid=$(echo "$pick" | cut -d'|' -f1)

        local active=1
        while [[ $active -eq 1 ]]; do
            local act
            act=$(yad --list --title="Actions" --column="Action" --geometry=$W_SUB --text="Project: $pid" \
                --button="Cancel:1" --button="Open:0" \
                "1. [VIEW] List jobs" "2. Delete ALL" "3. Delete FAILED" "4. Delete OLD" "5. Select SPECIFIC")
            [[ $? -ne 0 ]] && { active=0; break; }

            local jsons ids=""
            jsons=$(fetch_all_pages "$GIT_URL/api/v4/projects/$pid/jobs")

            # FIX #6: Validate before using job data in GUI too
            if ! validate_jobs_response "$jsons" "Jobs API"; then
                yad --error --text="Failed to fetch jobs. Check project ID and token."
                continue
            fi

            case "$act" in
                *"1."*)
                    local tbl
                    tbl=$(echo "$jsons" | jq -r 'sort_by(.status) | .[] | "\(.status)\n\(.name)\n\(.created_at)"' | sed '/^$/d')
                    # FIX #8: printf instead of echo -e
                    printf '%s\n' "$tbl" | yad --list --title="Jobs" --column="Status" --column="Name" --column="Date" --geometry=$W_MAX --button="Back:1"
                    continue ;;
                *"2."*)
                    local confirm
                    confirm=$(yad --entry --title="Safe Check" --text="Type 'MacnicaRocks' to wipe ALL:" --width=300 --button="Cancel:1" --button="OK:0")
                    [[ $? -ne 0 || "$confirm" != "MacnicaRocks" ]] && continue
                    ids=$(echo "$jsons" | jq -r '.[] | select(.artifacts_file != null) | .id') ;;
                *"3."*)
                    ids=$(echo "$jsons" | jq -r '.[] | select(.artifacts_file != null and .status == "failed") | .id') ;;
                *"4."*)
                    local days
                    days=$(yad --entry --title="Cleanup" --text="How many days?" --width=300)
                    [[ $? -ne 0 ]] && continue
                    # FIX #2 & #4: Use days_ago helper; renamed 'cut' -> 'cutoff' to avoid
                    #               shadowing the system 'cut' command
                    local cutoff
                    cutoff=$(days_ago "$days")
                    ids=$(echo "$jsons" | jq -r --arg c "$cutoff" '.[] | select(.artifacts_file != null and .created_at < $c) | .id') ;;
                *"5."*)
                    local s_list spec
                    s_list=$(echo "$jsons" | jq -r '.[] | "\(.id)\n\(.status)\n\(.name)"' | sed '/^$/d')
                    # FIX #8: printf instead of echo -e
                    spec=$(printf '%s\n' "$s_list" | yad --list --title="Select Job" --column="ID" --column="Status" --column="Name" --geometry=$W_MAX --button="Cancel:1")
                    [[ $? -ne 0 ]] && continue
                    ids=$(echo "$spec" | cut -d'|' -f1) ;;
            esac

            if [[ -n "$ids" ]]; then
                local count cur=0
                count=$(echo "$ids" | wc -w)
                (for id in $ids; do
                    curl_auth_delete "$GIT_URL/api/v4/projects/$pid/jobs/$id/artifacts"
                    cur=$((cur+1)); echo "$((cur*100/count))"; echo "# Nuking $id ($cur/$count)..."
                done) | yad --progress --title="Wiping" --auto-close --width=300
                yad --info --text="Done." --width=200
            fi
        done
    done
}

# Entry
[[ "$1" == "--help" ]] && usage
verify
while getopts "p:afd:lh" o; do
  case $o in
    p) c_pid=$OPTARG ;;
    a) c_mode="all" ;;
    f) c_mode="failed" ;;
    d) c_mode="days"; c_val=$OPTARG ;;
    l) c_mode="list" ;;
    *) usage ;;
  esac
done
if [[ -n "$c_pid" ]]; then
    [[ -z "$c_mode" ]] && { echo "Need an action flag (-a, -f, -d, or -l)."; exit 1; }
    do_cli "$c_pid" "$c_mode" "$c_val"
else
    do_gui
fi

