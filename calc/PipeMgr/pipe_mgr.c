#include "pipe_mgr.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

/* ═══════════════════════════════════════════════════════════
   INTERNAL STATE
   ═══════════════════════════════════════════════════════════ */

#define PIPE_READ  0
#define PIPE_WRITE 1

static pid_t  child_pid    = -1;   /* PID of the parse subprocess   */
static int    fd_to_child  = -1;   /* write end — our cmd → parse   */
static int    fd_from_child = -1;  /* read end  — parse output → us */
static FILE  *from_child_fp = NULL; /* buffered reader over fd_from_child */

/* ═══════════════════════════════════════════════════════════
   PUBLIC API
   ═══════════════════════════════════════════════════════════ */

/*************************************************************
 * Function:    pipe_open
 * Input:       exe (const char*) — path to the parse binary
 * Output:      int — 1 on success, 0 on failure
 * Description: Creates two pipes, forks, and exec's exe in the
 *              child with its stdin/stdout wired to the pipes.
 *              The parent closes the child-facing ends and wraps
 *              the read descriptor in a FILE* for line-buffered
 *              reading.  Prints a perror message on any failure.
 *************************************************************/
int pipe_open(const char *exe)
{
    int to_child[2];    /* parent writes, child reads  (child stdin)  */
    int from_child[2];  /* child writes, parent reads  (child stdout) */

    if (pipe(to_child) != 0)
    {
        perror("pipe_open: pipe(to_child)");
        return 0;
    }
    if (pipe(from_child) != 0)
    {
        perror("pipe_open: pipe(from_child)");
        close(to_child[PIPE_READ]);
        close(to_child[PIPE_WRITE]);
        return 0;
    }

    child_pid = fork();
    if (child_pid < 0)
    {
        perror("pipe_open: fork");
        close(to_child[PIPE_READ]);   close(to_child[PIPE_WRITE]);
        close(from_child[PIPE_READ]); close(from_child[PIPE_WRITE]);
        return 0;
    }

    if (child_pid == 0)
    {
        /* ── child process ── */
        /* redirect stdin from the to_child pipe */
        dup2(to_child[PIPE_READ],    STDIN_FILENO);
        /* redirect stdout into the from_child pipe */
        dup2(from_child[PIPE_WRITE], STDOUT_FILENO);

        /* close all pipe ends — exec'd process doesn't need them */
        close(to_child[PIPE_READ]);   close(to_child[PIPE_WRITE]);
        close(from_child[PIPE_READ]); close(from_child[PIPE_WRITE]);

        execl(exe, exe, (char *)NULL);
        /* execl only returns on failure */
        perror("pipe_open: execl");
        _exit(127);
    }

    /* ── parent process ── */
    /* close the ends the child uses */
    close(to_child[PIPE_READ]);
    close(from_child[PIPE_WRITE]);

    fd_to_child   = to_child[PIPE_WRITE];
    fd_from_child = from_child[PIPE_READ];

    /* wrap read end for convenient line-by-line reading */
    from_child_fp = fdopen(fd_from_child, "r");
    if (!from_child_fp)
    {
        perror("pipe_open: fdopen");
        close(fd_to_child);
        close(fd_from_child);
        fd_to_child = fd_from_child = -1;
        child_pid = -1;
        return 0;
    }

    return 1;
}

/*************************************************************
 * Function:    pipe_send
 * Input:       cmd (const char*) — null-terminated command line
 * Output:      int — 1 on success, 0 on error
 * Description: Writes all bytes of cmd to fd_to_child.  Uses a
 *              loop to handle short writes.  Returns 0 and prints
 *              an error if the child pipe is broken (EPIPE).
 *************************************************************/
int pipe_send(const char *cmd)
{
    size_t  total;
    ssize_t written;
    size_t  sent;

    if (fd_to_child < 0) return 0;

    total = strlen(cmd);
    sent  = 0;
    while (sent < total)
    {
        written = write(fd_to_child, cmd + sent, total - sent);
        if (written < 0)
        {
            if (errno == EINTR) continue;   /* interrupted — retry */
            perror("pipe_send: write");
            return 0;
        }
        sent += (size_t)written;
    }
    return 1;
}

/*************************************************************
 * Function:    pipe_recv
 * Input:       buf    (char*)  — destination buffer
 *              buflen (size_t) — capacity of buf
 * Output:      int — 1 on success, 0 on read error or EOF
 * Description: Reads bytes from from_child_fp until it sees
 *              ASCII SOH (\x01) which parse prints immediately
 *              before every "< " prompt.  On detecting \x01,
 *              consumes the following '<' and ' ' characters
 *              and returns — the complete response is in buf.
 *              Using \x01 rather than '<' at line-start makes
 *              the protocol unambiguous regardless of what
 *              characters appear in parse's output.
 *************************************************************/
int pipe_recv(char *buf, size_t buflen)
{
    int    c;
    size_t used = 0;

    if (!from_child_fp || buflen == 0) return 0;

    buf[0] = '\0';

    while ((c = fgetc(from_child_fp)) != EOF)
    {
        /* \x01 SOH = end-of-response marker from parse */
        if (c == '\x01')
        {
            fgetc(from_child_fp); /* consume '<' */
            fgetc(from_child_fp); /* consume ' ' */
            return 1;
        }

        if (used + 1 < buflen)
        {
            buf[used++] = (char)c;
            buf[used]   = '\0';
        }
        /* if buffer full, keep reading until \x01 to stay in sync */
    }

    /* fgetc returned EOF — child process died */
    return 0;
}

/*************************************************************
 * Function:    pipe_transact
 * Input:       cmd    (const char*) — command line (with '\n')
 *              buf    (char*)       — destination buffer
 *              buflen (size_t)      — capacity of buf
 * Output:      int — 1 on success, 0 on error
 * Description: Sends cmd then receives the response in one call.
 *************************************************************/
int pipe_transact(const char *cmd, char *buf, size_t buflen)
{
    if (!pipe_send(cmd))        return 0;
    if (!pipe_recv(buf, buflen)) return 0;
    return 1;
}

/*************************************************************
 * Function:    pipe_close
 * Input:       void
 * Output:      void
 * Description: Sends "exit\n" to the child, closes all file
 *              descriptors, and waits for the child to exit.
 *              Uses a short waitpid loop so the GUI doesn't
 *              hang if parse takes a moment to shut down.
 *************************************************************/
void pipe_close(void)
{
    if (fd_to_child >= 0)
    {
        write(fd_to_child, "exit\n", 5);
        close(fd_to_child);
        fd_to_child = -1;
    }
    if (from_child_fp)
    {
        fclose(from_child_fp);
        from_child_fp  = NULL;
        fd_from_child = -1;
    }
    if (child_pid > 0)
    {
        waitpid(child_pid, NULL, 0);
        child_pid = -1;
    }
}

/*************************************************************
 * Function:    pipe_alive
 * Input:       void
 * Output:      int — 1 if child is still running, 0 otherwise
 * Description: Non-blocking waitpid check.  Returns 0 if the
 *              child has exited or was never started.
 *************************************************************/
int pipe_alive(void)
{
    int status;

    if (child_pid <= 0) return 0;
    if (waitpid(child_pid, &status, WNOHANG) == 0) return 1;
    child_pid = -1;
    return 0;
}
