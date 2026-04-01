/*
 * Program		: Onyxx CAN File System (OCANFS)
 * Author		: Bryan Wilcutt
 * Date			: 9/15/2016
 * File			: dirmgr.h
 *
 * About:
 *
 * This file supports the Onyxx FUSE File System for CAN and others.  This file contains support implements for
 * using the directory manager including API definitions.
 */

#ifndef DIRMGR_H_
#define DIRMGR_H_

#define MAX_NAME_SIZE 64

// Modes

typedef enum {
	ff_dir			= 1,	// This is a directory entry
	ff_file			= 2,	// This is a file entry
	ff_created		= 4,	// Object is created and in use
	ff_open			= 8,	// Object is in open mode via file system
	ff_dirty		= 16,	// File is dirty, needs updating to CAN when closed or flushed
} fileflags_e;

struct d_node_s {
	struct d_node_s *next;
	struct d_node_s *prev;
	struct d_node_s *parent;
	struct d_node_s *child;
	void *data;
	const char name[MAX_NAME_SIZE];
	fileflags_e fflags;
	__mode_t mode;
};

extern struct d_node_s *systemParent;

extern int addDirectory(const char *path);
extern int addMasterDirectory(const char *path);
extern int addFile(const char *path, char *fname, void *data, __mode_t mode);
extern int delFile(const char *path);
extern int delDirectory(const char *path);
extern struct d_node_s *getPathNode(const char *path);
extern fileflags_e getPathFlags(const char *path);
extern void *getPathAttribute(const char *path);
extern __mode_t getPathMode(const char *path);
extern void setAllFlags(char *path, fileflags_e ff);
extern void unsetAllFlags(char *path, fileflags_e ff);

#endif /* DIRMGR_H_ */
