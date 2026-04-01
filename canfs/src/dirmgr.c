/*
 * Program		: Onyxx CAN File System (OCANFS)
 * Author		: Bryan Wilcutt
 * Date			: 9/15/2016
 * File			: dirmgr.c
 *
 * About:
 *
 * This file supports the Onyxx FUSE File System for CAN and others.  This file implements and extends the ability
 * to maintain a directory hierarchy and allow that hierarchy to be extended to the FUSE system.  The API for this
 * system is defined:
 *
 * initMemFileSys 	- Initialize this file system along with FUSE.
 * addDirectory		- Add a directory to the file system
 * addFile			- Add a file to the file system
 * delFile			- Deletes a file from the file system
 * delDirectory		- Deletes a directory and all subnodes
 * getPathNode 		- Return a node of an object pointed to by given path
 * getPathFlags		- Return an object's flags
 * getPathAttribute - Return an object's user defined attribute
 * getPathMode		- Return the mode flags of a defined object
 * setAllFlags		- Set all flags of an object and subobjects
 * unsetAllFlags	- Unsets all flags of an object and subobjects
 *
 * The file system uses a dynamic approach to managing system elements, therefore all objects are allocated memory
 * objects.  Each element (file) contains a void * pointer to a user defined object.  This object should be used
 * to contain the data of the object, however this system will not manipulate it or inspect it.
 *
 * To use
 *
 * Call initMemFileSys() first to initialize necessary data.  Adding files, directories and subdirectories can
 * be done by definding a path string for those objects.  Note that initMemFielSys will define the top-level
 * directory.
 *
 * There are no specific limitations to adding elements, only memory availability.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libgen.h>
#include <sys/stat.h>
#include "dirmgr.h"

/* Prototypes of internal functions.  API functions are
 * defined in the dirmgr.h file.
 */

struct d_node_s *systemParent = NULL;
int split_name(char *path, char *parname);
void kill_tree(struct d_node_s *obj);
struct d_node_s *add_entry(struct d_node_s *obj, char *fname, void *data);
void rem_entry(struct d_node_s *obj);
struct d_node_s *locate_entry(const char *path, struct d_node_s *parent);
void set_flags(struct d_node_s *obj, fileflags_e ff);
void unset_flags(struct d_node_s *obj, fileflags_e ff);

/******************************************************
 * Function		: getPathNode
 * Input		: Char * path of file or directory
 * Output		: struct d_node_s * of found entry
 * 				  NULL if not found
 *
 * Returns the d_node_s pointer to the path object given.
 ******************************************************/
struct d_node_s *getPathNode(const char *path)
{
	struct d_node_s *retVal = NULL;

	retVal = locate_entry(path, systemParent);

	return retVal;
}

/******************************************************
 * Function		: getPathFlags
 * Input		: Char * path of file or directory
 * Output		: Flags from the found node entry
 * 				  0 if not found
 *
 * Returns the d_node_s flags from the object indicated
 * by the path.
 ******************************************************/
fileflags_e getPathFlags(const char *path)
{
	struct d_node_s *node = NULL;
	fileflags_e retVal = 0;

	if ((node = locate_entry(path, systemParent)) != NULL)
		retVal = node->fflags;

	return retVal;
}

/******************************************************
 * Function		: getPathMode
 * Input		: Char * path of file or directory
 * Output		: __mode_t File Mode flags from the found
 * 				  node entry 0 if not found
 *
 * Returns the d_node_s modes from the object indicated
 * by the path.
 ******************************************************/
__mode_t getPathMode(const char *path)
{
	struct d_node_s *node = NULL;
	__mode_t retVal = 0;

	if ((node = locate_entry(path, systemParent)) != NULL)
		retVal = node->mode;

	printf("\ngetPathMode(%s) = %d\n", path, (node != NULL) ? node->mode : -1);
	return retVal;
}

/******************************************************
 * Function		: getPathAttribute
 * Input		: Char * path of file or directory
 * Output		: Void * data from the found node entry
 * 				  0 if not found
 *
 * Returns the d_node_s data ptr from the object indicated
 * by the path.
 ******************************************************/
void *getPathAttribute(const char *path)
{
	struct d_node_s *node = NULL;
	void *retVal = NULL;

	if ((node = locate_entry(path, systemParent)) != NULL)
		retVal = node->data;

	return retVal;
}

/******************************************************
 * Function		: addDirectory
 * Input		: Char * path
 * Output		: 0 = Failure, 1 = Success
 *
 * Using the given path, will create all directory nodes
 * until the path has been fulfilled.
 ******************************************************/
int addDirectory(const char *path)
{
	int retVal = 0; // Failure
	struct d_node_s *obj = NULL;
	struct d_node_s *parent = systemParent;

	char parname[512];
	char parpath[512];
	char part[64];
	char *pathname;

	pathname = strdup(path);
	parname[0] = 0;
	parpath[0] = 0;

	if (pathname)
	{
		/* Grab the header name from the path, check for existence.
		 * If it exists, add it to our on-going path and get the next
		 * header name.  When we get to a name that doesn't exist, create it
		 * as a directory.
		 */

		while (split_name(pathname, parname))
		{
			sprintf(part, "/%s", parname);
			strcat(parpath, part);

			/* Does this path exist?*/

			if ((obj = locate_entry(parpath, parent)) == NULL)
			{
				/* New path entry, create an object for it. */

				do {
					if ((obj = add_entry(parent, parname, NULL)) != NULL)
					{
						obj->fflags = ff_dir;
						obj->mode = S_IFDIR | 0755;
						parent = obj;

						retVal = 1; // Succeeded
					}
				} while (split_name(pathname, parname));
			} else {
				parent = obj;
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: addMasterDirectory
 * Input		: Char * path
 * Output		: 0 = Failure, 1 = Success
 *
 * Using the given path, will create a master entry in the
 * main root of the file system.  All sub directories should
 * the addSubDirectory function.
 ******************************************************/
int addMasterDirectory(const char *path)
{
	int retVal = 0; // Failure
	char parname[512];
	char *pathname;
	struct d_node_s *newObj = NULL;

	pathname = strdup(path);
	parname[0] = 0;

	if (pathname)
	{
		/* Grab the header name from the path, check for existence.
		 * If it exists, add it to our on-going path and get the next
		 * header name.  When we get to a name that doesn't exist, create it
		 * as a directory.
		 */

		if (getPathNode(path) == NULL)
		{
			if (split_name(pathname, parname))
			{

				if ((newObj = (struct d_node_s *) malloc(sizeof(struct d_node_s))) != NULL)
				{
					memset(newObj, 0, sizeof(struct d_node_s));

					strcpy((char *) newObj->name, parname);
					newObj->fflags = ff_dir;
					newObj->mode = S_IFDIR | 0755;

					if (systemParent == NULL)
						systemParent = newObj;
					else {
						systemParent->prev = newObj;
						newObj->next = systemParent;
						systemParent = newObj;
					}

					retVal = 1;
				}
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: delDirectory
 * Input		: Char * of directory path
 * Output		: 1 = Success, 0 = Failure
 *
 * Deletes a directory entry from the file system.  All
 * sub directories and sub files are also deleted.
 ******************************************************/
int delDirectory(const char *path)
{
	int retVal = 0; // Failure
	struct d_node_s *obj = NULL;

	if (path)
	{
		if ((obj = locate_entry(path, systemParent)) != NULL)
		{
			if (obj->fflags & ff_dir)
			{
				rem_entry(obj);
				retVal = 1; // Success
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: delFile
 * Input		: Char * name of file
 * Output		: 0 = Failure, 1 = Success
 *
 * Deletes the given file from the system.
 ******************************************************/
int delFile(const char *path)
{
	int retVal = 0; // Failure
	struct d_node_s *obj = NULL;

	if (path)
	{
		if ((obj = locate_entry(path, systemParent)) != NULL)
		{
			if (obj->fflags & ff_file)
			{
				rem_entry(obj);
				retVal = 1; // Success
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: AddFile
 * Input		: Char * root path of file
 * 				  Char * file name
 * 				  Void * associative data for file
 * 				  __mode_t mode of file (Unit flags)
 * Output		: 0 = Failure, 1 = Success
 *
 * Creates a file entry in the given path.  Attaches the
 * associated data point to the file structure.  This
 * pointer, user defined, should contain "the data" of the
 * file itself.
 ******************************************************/
int addFile(const char *path, char *fname, void *data, __mode_t mode)
{
	int retVal = 0; // Failure
	struct d_node_s *obj = NULL;

	if (path && fname)
	{
		if ((obj = locate_entry(path, systemParent)) != NULL)
		{
			if ((obj = add_entry(obj, fname, data)) != NULL)
			{
				obj->fflags = ff_file;
				obj->mode = mode | S_IFREG;
				retVal = 1; // Success
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: setAllFlags
 * Input		: Char * starting path
 * 				  Flags
 * Output		: None
 *
 * Sets flags for starting path and all files under.
 ******************************************************/
void setAllFlags(char *path, fileflags_e ff)
{
	struct d_node_s *iter = NULL;
	struct d_node_s *obj = NULL;

	if ((obj = getPathNode(path)) != NULL)
	{
		obj->fflags |= ff;

		if ((iter = obj->child) != NULL)
		{
			set_flags(obj->child, ff);
		}
	}
}

/******************************************************
 * Function		: unsetAllFlags
 * Input		: Char * starting path
 * 				  Flags
 * Output		: None
 *
 * Unsets flags for starting path and all files under.
 ******************************************************/
void unsetAllFlags(char *path, fileflags_e ff)
{
	struct d_node_s *iter = NULL;
	struct d_node_s *obj = NULL;

	if ((obj = getPathNode(path)) != NULL)
	{
		obj->fflags &= ~ff;

		if ((iter = obj->child) != NULL)
		{
			unset_flags(obj->child, ff);
		}
	}
}

/******************************************************
 * Function		: get_match
 * Input		: struct d_node_s * to starting position
 * 				  char * file name to find
 * Output		: struct d_node_s * to found structure,
 * 				  NULL if not found.
 *
 * Searches for the given file name at the starting
 * iterative position.  Returns NULL if not found.  Will
 * search only at the same level as iter.
 ******************************************************/
struct d_node_s *get_match(struct d_node_s *iter, char *fname)
{
	while (iter != NULL)
	{
		if (strcmp(iter->name, fname) != 0)
		{
			iter = iter->next;
		} else {
			break;
		}
	}

	return iter;
}

/******************************************************
 * Function		: add_entry
 * Input		: char * root path of entry
 * 				  char * name of entry
 * 				  void * associated data of entry
 * Output		: struct d_node_s * of new entry
 * 				  NULL if error
 *
 * Adds a new node to the file structure tree.
 ******************************************************/
struct d_node_s *add_entry(struct d_node_s *obj, char *fname, void *data)
{
	struct d_node_s *newObj = NULL;

	if (fname)
	{
		if (get_match((obj == NULL) ? NULL : obj->child, fname) == NULL)
		{
			if ((newObj = (struct d_node_s *) malloc(sizeof(struct d_node_s))) != NULL)
			{
				memset(newObj, 0, sizeof(struct d_node_s));

				strcpy((char *) newObj->name, fname);
				newObj->data = data;
				newObj->next = (obj == NULL) ? NULL : obj->child;
				newObj->prev = NULL;

				// Add to subdirectory

				if (obj->child)
					obj->child->prev = newObj;

				obj->child = newObj;
				newObj->parent = obj;
			}
		}
	}

	return newObj;
}

/******************************************************
 * Function		: rem_entry
 * Input		: char * path of entry
 * Output		: None
 *
 * Removes a file system entry and all sub entries.
 ******************************************************/
void rem_entry(struct d_node_s *obj)
{
	struct d_node_s *iter = NULL;

	if (obj)
	{
		if ((iter = obj->child) != NULL)
		{
			kill_tree(obj->child);
			if (obj->prev == NULL)
			{
				if (obj->parent)
				{
					obj->parent->child = obj->next;
				}
			} else {
				if (obj->next)
					obj->next->prev = obj->prev;
				if (obj->prev)
					obj->prev->next = obj->next;

				free(obj);
			}
		}
	}
}

/******************************************************
 * Function		: kill_tree
 * Input		: struct d_node_s * tree entry to start
 * Output		: None
 *
 * Iteratively deletes a node and all subnodes.
 ******************************************************/
void kill_tree(struct d_node_s *obj)
{
	struct d_node_s *node = NULL;

	if (obj)
	{
		kill_tree(obj->child);

		while (obj)
		{
			node = obj->next;
			free(obj);
			obj = node;
		}
	}
}

/******************************************************
 * Function		: set_flags
 * Input		: struct d_node_s * tree entry to start
 * 				  Flags
 * Output		: None
 *
 * Iteratively sets all object files.
 ******************************************************/
void set_flags(struct d_node_s *obj, fileflags_e ff)
{
	if (obj)
	{
		set_flags(obj->child, ff);

		while (obj)
		{
			obj->fflags |= ff;
			obj = obj->next;
		}
	}
}

/******************************************************
 * Function		: unset_flags
 * Input		: struct d_node_s * tree entry to start
 * 				  Flags
 * Output		: None
 *
 * Iteratively unsets all object files.
 ******************************************************/
void unset_flags(struct d_node_s *obj, fileflags_e ff)
{
	if (obj)
	{
		set_flags(obj->child, ff);

		while (obj)
		{
			obj->fflags &= ~ff;
			obj = obj->next;
		}
	}
}

/******************************************************
 * Function		: locate_entry
 * Input		: char * path of entry
 *  			  struct d_node_s * starting point
 * Output		: struct d_node_s * of found entry
 * 				  NULL if not found
 *
 * Locates an entry in the file system based on path.
 * Paths may appear as:
 *  /root/sub/sub/file
 *  root/sub/file
 *  root
 *  file
 * Names such as "." and ".." do not exist.
 ******************************************************/
struct d_node_s *locate_entry(const char *path, struct d_node_s *parent)
{
	char parname[255];
	char *pcpy = NULL;
	struct d_node_s *retVal = NULL;
	struct d_node_s *iter = NULL;

	pcpy = strdup(path);

	if (parent)
	{
		if (strcmp(path, "/") == 0)
		{
			retVal = parent;
		} else {
			iter = parent;

			while (split_name(pcpy, parname))
			{
				if ((retVal = get_match(iter, parname)) != NULL)
				{
					iter = retVal->child;
				}
			}
		}
	}

	if (pcpy)
		free(pcpy);

	return retVal;
}

/******************************************************
 * Function		: split_name
 * Input		: char * path to split
 * 				  char * return root name
 * Output		: 0 = No more to split
 * 				  1 = Split successful but more remains
 *
 * Removes the head name in a path.  Will modify the
 * path name pointer when completed.
 *
 * Examples:
 *   Given                 Parname    Path
 *   /root/sub/sub/file     root       sub/sub/file
 *   sub/file               sub        file
 ******************************************************/
int split_name(char *path, char *parname)
{
	char *s = NULL;
	char *e = NULL;

	if (path[0] != 0)
	{
		if ((s = strstr(path, "/")) != NULL)
		{
			s++;
		} else {
			s = path;
		}

		if ((e = strstr(s, "/")) != NULL)
		{
			e--;
		} else {
			e = s + strlen(s);
		}

		memcpy(parname, s, e - s + 1);
		parname[e - s + 1] = 0;

		if (*e == 0)
			path[0] = 0;
		else
			strcpy(path, e + 1);
	}

	return (e != NULL);
}

