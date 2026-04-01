GITOUT

This is a GitLab tool that operates in CLI mode or GUI mode.

The purpose of this tool is to allow you to go through your GitLab repositories and delete old artifacts, or artifacts that fall within
a certain criteria.  

The tool is self explanatory once you begin using it.  It also contains certain safety measures to allow accidents from occurring.

To run GITOUT in GUI:

> sudo gitout.sh

To run GITOUT as a command line tool:

> sudo gitout.sh --help

Requirement:  You must create a PERSONAL ACCESS TOKEN (PAT) in GitLab and add it to your ~/.bashrc file:

> export GIT_TOKEN="<your token here>"

Also set the URL for the Git repository you are using (GitLab, GitHub, etc.)

> export GIT_URL="https://github.com"
or
> export GIT_URL="https://gitlab.com"
or
<what ever your URL is...>

GITOUT will use your token to find your projects and build jobs.

If you can MEANINGFULLY add to the script, please feel free to do so and email a copy to me at bwilcutt@yahoo.com.

Time to engineer this script (only tested with GitLab, honestly) was 2 days.

Bryan Wilcutt
3.31.26
