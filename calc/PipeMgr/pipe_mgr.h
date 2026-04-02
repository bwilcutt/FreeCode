#ifndef PIPE_MGR_H
#define PIPE_MGR_H

/*************************************************************
 * pipe_mgr.h — bidirectional pipe manager for the parse subprocess
 *
 * Spawns and manages a long-running "parse" child process with
 * two pipes:  one for writing commands to its stdin, and one
 * for reading responses from its stdout.
 *
 * Protocol:
 *   - Caller writes one command line via pipe_send()
 *   - parse executes the command and writes output lines
 *   - parse signals readiness with a line starting with '<'
 *   - pipe_recv() accumulates output and returns when '<' is seen
 *
 * Typical usage:
 *   if (!pipe_open("./parse"))   { ... handle error ... }
 *   pipe_recv(buf, sizeof(buf)); // consume startup prompt
 *   pipe_send("2 + 2\n");
 *   pipe_recv(buf, sizeof(buf)); // buf now holds "4\n"
 *   pipe_close();
 *************************************************************/

#include <stddef.h>

/* Opaque state — do not access fields directly */
typedef struct PipeMgr PipeMgr;

// Pipe API Functions

int pipe_open(const char *exe);
int pipe_send(const char *cmd);
int pipe_recv(char *buf, size_t buflen);
int pipe_transact(const char *cmd, char *buf, size_t buflen);
void pipe_close(void);
int pipe_alive(void);

#endif /* PIPE_MGR_H */