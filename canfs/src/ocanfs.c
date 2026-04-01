/*
 * Program		: Onyxx CAN File System (OCANFS)
 * Author		: Bryan Wilcutt
 * Date			: 8/2/2016
 * File			: ocanfs.c
 *
 * About:
 *
 * This file represents the virtual memory file system used by the Onyxx device to export and import data to and
 * the Onyxx CAN bus.  The virtual file system is hard coded to mount at /mnt/ocanfs.
 *
 * Testing
 *
 * Define "TEST_MODE" to place unit into a test phase.
 *
 * FUSE must be installed on platform for this software to work.
 *
 * > sudo apt-get install fuse
 *
 * The Onyxx CAN ID Field and Onyxx CAN messages:
 *
 *	Pinging
 *
 *	Pinging can occur from either HOST to SLAVE or SLAVE to HOST by:
 *
 *	HOST to SLAVE:
 *	HOST -> WAY (dev ID)            -> SLAVE
 *	HOST <- IAM (dev ID + mac)      <- SLAVE
 *	HOST -> UAR (dev ID + mac)      -> SLAVE
 *
 *	SLAVE to HOST:
 *	SLAVE -> IAM (dev ID + mac)     -> HOST
 *	SLAVE <- UAR (dev UD + mac)     <- HOST
 *
 *	Slave Startup
 *
 *	Startup SLAVE to HOST negotiation:
 *
 *	SLAVE -> IAM (dev ID{0} + mac)  -> HOST
 *	SLAVE <- UAR (dev ID + mac)     <- HOST
 *
 *	Host Startup (post)
 *
 *	The post start is when the HOST was reset but not the slaves.
 *
 *	SLAVE(n) -> can_msg (unkn dev ID)   -> HOST
 *	SLAVE(n) <- WAY (dev ID)        <- HOST
 *	SLAVE(n) -> IAM (dev ID + mac)  -> HOST
 *
 *	Slave Reset
 *
 *	Software may request for a slave to be reset.  Software could also reset the master but not the slaves or perhaps the master and all the slaves.
 *
 *	SLAVE <- RESET (dev ID)         <- HOST
 *	** reset occurs **
 *	SLAVE -> IAM (dev ID {0} + mac) -> HOST
 *	SLAVE <- UAR (dev ID + mac)     <- HOST
 *
 *  Standard CAN 11-bit packet is defined as:
 *  SOF (1) - ID (11) - CF (6) - Data (8n) - CRC (15) - ACK (2) - EOF (7)
 *
 *  Note that the Onyxx Frame is defined in the Data field of the standard 11-bit CAN frame.
 *
 *	Onyxx Identifier
 *
 *	0123456789a
 *	===========
 *	00000000000
 *  ^---------^
 *  |
 *  + Identifier (0 = host)
 *
 *  Identifier = 00000000000
 *  	This is a device-to-host command/resp (IAM)
 *
 *  Identifier = 00000000001
 *      This is a host-to-device command/resp (UAR, WAY, RESET)
 *
 *  Identifier = 00000000002
 *      This is a host receive CAN message to update a point.
 *
 *  Identifier = 00000000003+
 *      Assigned ranges for other devices.
 *
 *  Data Field of message:
 *
 *  0          1       2        3        bytes
 *	01 23 4567 89abcdef01234567 89abcdef bits
 *	== == ==== ================ ========
 *	00 00 0000 0000000000000000 00000000  (Byte 3 for MAC transmission only)
 *  ^^ ^^ ^--^ ^------------------------>>>
 *  |  |  |    |
 *  |  |  |    +- Value (2-bytes)
 *  |  |  +- Channel (0 - 7 for d0/a0, 0-15 for ui)
 *  |  +- Command
 *  +- Type
 *
 *  Types:
 *  00 12 34 56 - Add new device with mac 123456
 *  Name           Read   Write   Type field
 *  D0 value        X      -		00
 *  A0 value        X      -		01
 *  UI value        X      X        10
 *  UI mode         X      X        11 (Non-host only)
 *
 *  Commands:
 *
 *  Set All				= 00
 *  Set One				= 01
 *  ID = 0 (to host)
 *  IAM					= 00
 *  ID = 1 (to slave)
 *  UAR					= 01
 *  WAY					= 10
 *  RESET				= 11
 *
 *  Modes (Set Mode must be defined in Command field)
 *  Allows device to change GPIOs for mode.
 *
 *  Voltage				= 00000000
 *  Current				= 00000001
 *  Resistance			= 00000010
 *
 *  Onyxx ommands (Onyxx Cmd must be defined in Command field when ID = 0 for Host
 *  bound msgs, ID=1 for slave bound messages):
 *
 *  00 = SLAVE to HOST – IAM (I am… ) message
 *		SLAVE sends this message periodically or as a reply to a WAY can_msg.
 *	01 = HOST to SLAVE UAR (You are…) message
 *		Response to 000 but includes unique ID to SLAVE  in Device ID field
 *	10 = HOST to SLAVE WAY (Who are you?) message
 *		HOST sends this message when receiving a Device ID not seen before, SLAVE replies with IAM.  This could occur if the HOST was reset but not the slaves.
 *	11 = HOST to SLAVE RESET message
 *		HOST requests SLAVE to reset.  When slave comes back up the IAM-UAR negotiations begin again.
 *
 *  For command "IAM" and "UAR", data fields (3 bytes) indicate:
 *  Last 3 bytes of LynxSpring UID MAC address
 *
 *  UAR Command:
 *
 *
 *  The OCAN system creates a file structure similar to:
 *
 *  /mnt/ocanfs/onyxx_{mac}/ui
 *  	/ui.{num}
 *  		value	(0 or 1)
 *  		mode	(resistance, current or voltage)
 *  	/d0.{num}
 *  		value
 *  	/a0.{num}
 *  		value
 *
 *  {mac} - MAC address of device
 *
 */

#include "onyxx_can.h"
#include "ptmgr.h"
#include "dirmgr.h"
#include <sys/time.h>

/******************************************************
 * Function		: do_releasedir
 * Input		: String ptr to path of directory to open
 * 				  ptr to File Info
 * Output		: 0 = Successful, <0 = Error
 *
 * Description	: This function does nothing but does assure
 * the file exists.
 ******************************************************/
static int do_releasedir(const char *path, struct fuse_file_info *fi)
{
	int retVal = 0;

#ifdef TEST_MODE
	can_msg("do_releasedir: %s\n", path);
#endif


	if (!(getPathFlags((char *) path) & ff_dir))
		retVal = -ENOENT;

	return retVal;
}

/******************************************************
 * Function		: do_fsyncdir
 * Input		: String ptr to path of directory to open
 * 				  ptr to File Info
 * Output		: 0 = Successful, <0 = Error
 *
 * Description	: This function does nothing but does assure
 * the file exists.
 ******************************************************/
static int do_fsyncdir(const char *path, int t, struct fuse_file_info *fi)
{
	int retVal = 0;

#ifdef TEST_MODE
	can_msg("do_fsyncdir: %s synced\n");
#endif

	if (!(getPathFlags((char *) path) & ff_dir))
		retVal = -ENOENT;

	return retVal;
}

/******************************************************
 * Function		: do_readdir
 * Input		: String ptr to path of directory to open
 * 				  Output buffer
 * 				  Filler command pointer
 * 				  Starting offset in output buffer
 * 				  ptr to File Info
 * Output		: 0 = Successful, <0 = Error
 *
 * Description	: This function returns the contents of a
 * directory.
 ******************************************************/
static int do_readdir(const char *path, void *h, fuse_fill_dir_t filler, off_t offset, struct fuse_file_info *fi)
{

	int retVal = 0;
	struct d_node_s *node;

#ifdef TEST_MODE
	can_msg("do_readdir: %s\n", path);
#endif

	node = getPathNode(path);

	filler(h, ".", NULL, 0);
	filler(h, "..", NULL, 0);

	/* Look at all parent level items if we're at "/", otherwise look at children under the
	 * given path.
	 */

	if (node && strcmp(path, "/") != 0)
		node = node->child;

	while (node)
	{
		filler(h, node->name, NULL, 0);
		node = node->next;
	}

	return retVal;
}

/******************************************************
 * Function		: do_opendir
 * Input		: String ptr to path of directory to open
 * Output		: Point to DIR or errors
 *
 * Description	: Since we don't use real streams, we return
 * a DIR type that we recognize as A0,D0 or UI.  If we don't
 * recognize the path, returns NULL.
 ******************************************************/
static int do_opendir(const char *path, struct fuse_file_info *fi)
{
	int retVal = 0;

#ifdef TEST_MODE
	can_msg("do_opendir: %s\n", path);
#endif

	if (!(getPathFlags((char *) path) & ff_dir) && strcmp(path, "/") != 0)
		retVal = -ENOENT;

	return retVal;
}

/******************************************************
 * Function		: do_getattr
 * Input		: String ptr to path of directory to open
 * 				  Ptr to stat structure for returned stats (size, etc.)
 * Output		: 0 = Successful, != 0 = Error
 *
 * Description	: Since we don't use real streams, we return
 * a DIR type that we recognize as A0,D0 or UI.  If we don't
 * recognize the path, returns NULL.
 ******************************************************/
static int do_getattr(const char *path, struct stat *st)
{
	int retVal = -ENOENT;
	o_node *node = NULL;
	struct d_node_s *fnode = NULL;

#ifdef TEST_MODE
	can_msg("do_getattr: %s\n", path);
#endif

	st->st_uid = getuid();
	st->st_gid = getgid();
	st->st_dev = st->st_rdev = 0; // getDevID(path);
	st->st_ctime = st->st_atime = st->st_mtime = time(NULL);

	if (strcmp(path, "/") == 0)
	{
		st->st_mode = S_IFDIR | 0755;
		st->st_nlink = 2;
		retVal = 0;
	} else {
		if ((fnode = getPathNode(path)) != NULL)
		{
			st->st_mode = fnode->mode;
			st->st_nlink = 1;

			if ((node = fnode->data) != NULL)
			{
				st->st_size = node->msize;
			} else {
				st->st_size = 0;
			}

			retVal = 0;
		}
	}

	// size seems to be at byte 48 in memory but defined at 56 in structure.

	return retVal;
}

static int do_fgetattr(const char *path, struct stat *st, struct fuse_file_info *fi)
{
#ifdef TEST_MODE
	can_msg("do_fgetattr: %s\n:", path);
#endif
	return do_getattr(path, st);
}

/******************************************************
 * Function		: do_read
 * Input		: String ptr to path of directory to open
 * 				  Pointer to output buffer
 * 				  Size of data to read
 * 				  Starting offset in source data
 * 				  ptr to File Info
 * Output		: # of bytes read, <0 = error
 *
 * Description	: Reads and returns data from the virtual data
 * point file [a | d | u].{num}/value or /mode
 ******************************************************/
static int do_read( const char *path, char *buffer, size_t size, off_t offset, struct fuse_file_info *fi)
{
	int retVal = -ENOENT; // Error
	o_node *node;
	char tmpbuf[40];
	struct timeval tm;
	unsigned long long tv = 0;
	fileflags_e ff;

#ifdef TEST_MODE
	can_msg("do_read: %s\n", path);
#endif

	if ((node = getPathAttribute(path)) != NULL)
	{
		if ((ff = getPathFlags(path)) & ff_open)
		{
			switch (node->typ)
			{
				case pt_mode: // Mode file
					if (node->data.c == ONYXX_MODE_RESISTANCE_V)
						strcpy(tmpbuf, ONYXX_MODE_RESISTANCE);
					else if (node->data.c == ONYXX_MODE_CURRENT_V)
						strcpy(tmpbuf, ONYXX_MODE_CURRENT);
					else if (node->data.c == ONYXX_MODE_VOLTAGE_V)
						strcpy(tmpbuf, ONYXX_MODE_VOLTAGE);
					else
						tmpbuf[0] = 0;

					node->msize = strlen(tmpbuf);
					retVal = (offset + size > node->msize) ? node->msize : size;
					memcpy(buffer, &tmpbuf[offset], retVal);
					break;

				case pt_id: // Device ID file
					sprintf(tmpbuf, "%d", node->data.id);
					retVal = (offset + size > node->msize) ? node->msize : size;
					memcpy(buffer, &tmpbuf[offset], retVal);
					break;

				case pt_stat: // Ping Stat, return epoch of last write to device
					retVal = (offset + size > node->msize) ? node->msize : size;
					gettimeofday(&tm, NULL);
					tv = tm.tv_sec * 1000 + tm.tv_usec / 1000;

					sprintf(buffer, "%013llu,%013llu", node->data.ts, (node->data.ts == 0) ? 0 : tv - node->data.ts);
					break;

				case pt_ui:
				case pt_a0:
					retVal = sprintf(buffer, "%u", node->data.i);

					break;

				case pt_d0:
					retVal = sprintf(buffer, "%s", (node->data.c == 0) ? "0" : "1");
					break;

				default:
					retVal = -ENOENT;
					break;
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: do_open
 * Input		: String ptr to path of directory to open
 * 				  ptr to File Info
 * Output		: 0 = Successful, <0 = Error
 *
 * Description	: This function does nothing but does assure
 * the file exists.
 ******************************************************/
static int do_open(const char* path, struct fuse_file_info *fi)
{
	int retVal = -ENOENT;
	struct d_node_s *node = NULL;

#ifdef TEST_MODE
	can_msg("do_open: %s\n", path);
#endif

	if ((node = getPathNode(path)) != NULL)
	{
		node->fflags |= ff_open;
		retVal = 0;
	}

	return retVal;
}

/******************************************************
 * Function		: do_release
 * Input		: String ptr to path of directory to open
 * 				  ptr to File Info
 * Output		: 0 = Successful, <0 = Error
 *
 * Description	: This function does nothing but does
 * assure the file exists.
 ******************************************************/
static int do_release(const char* path, struct fuse_file_info *fi)
{
	int retVal = -ENOENT; // No such file
	struct d_node_s *node = NULL;

#ifdef TEST_MODE
	can_msg("do_release: %s\n", path);
#endif

	if ((node = getPathNode(path)) != NULL)
	{
		node->fflags &= ~(ff_open);
		retVal = 0;
	}

	return retVal;
}

/******************************************************
 * Function		: do_write
 * Input		: String ptr to path of directory to write
 * 				  Pointer to input buffer
 * 				  Size of data to write
 * 				  Starting offset in source data
 * 				  ptr to File Info
 * Output		: # of bytes written, <0 = error
 *
 * Description	: Writes data to the given virtual file point
 * and returns the number of bytes written.
 ******************************************************/
static int do_write(const char *path, const char *buf, size_t size, off_t offset, struct fuse_file_info *fi)
{
	int retVal = size; // Success
	o_node *node = NULL;
	uint16_t v;
	struct timeval tm;
	struct d_node_s *fnode = NULL;
	char tmp[30];

#ifdef TEST_MODE
	can_msg("do_write: %s", path);
#endif

	gettimeofday(&tm, NULL);

	if ((fnode = getPathNode(path)) != NULL && size)
	{
		node = (o_node *) fnode->data;

		if (node)
		{
			switch(node->typ)
			{
				case pt_mode: // Mode file

					/* If this is a MODE file, interpret stings to values to save space and time. */

					if (strnicmp(buf, ONYXX_MODE_RESISTANCE, strlen(ONYXX_MODE_RESISTANCE)) == 0) {
						node->msize = strlen(ONYXX_MODE_RESISTANCE);
						node->data.c = ONYXX_MODE_RESISTANCE_V;
						node->tm = tm;
						fnode->fflags |= ff_dirty;

					} else if (strnicmp(buf, ONYXX_MODE_CURRENT, strlen(ONYXX_MODE_CURRENT)) == 0) {
						node->msize = strlen(ONYXX_MODE_CURRENT);
						node->data.c = ONYXX_MODE_CURRENT_V;
						node->tm = tm;
						fnode->fflags |= ff_dirty;

					} else if (strnicmp(buf, ONYXX_MODE_VOLTAGE, strlen(ONYXX_MODE_VOLTAGE)) == 0) {
						node->msize = strlen(ONYXX_MODE_VOLTAGE);
						node->data.c = ONYXX_MODE_VOLTAGE_V;
						node->tm = tm;
						fnode->fflags |= ff_dirty;
					} else
						retVal = -EINVAL;

					break;

				case pt_a0:
				case pt_ui:
					// For A0, D0 and UI value files, convert from ASCII to binary.
					// Store A0/UI as a 16-bit value.

					v = atoi(buf);
					if (v >=0 && v<= USHRT_MAX)
					{
						node->data.i = v;
						node->msize = sprintf(tmp, "%u", node->data.i);
						node->tm = tm;
						fnode->fflags |= ff_dirty;
					} else {
						retVal = -EINVAL;
					}
					break;

				case pt_d0:
					// For A0, D0 and UI value files, convert from ASCII to binary.

					if (buf[0] != '0')
						node->data.c = 1; // Digitals are on or off only
					else
						node->data.c = 0;
					break;

					fnode->fflags |= ff_dirty;
					node->tm = tm;
					break;

				case pt_unknown:
				case pt_id:
				default:
					retVal = -EBUSY;
					break;
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: do_flush
 * Input		: String ptr to path of directory to open
 * 				  ptr to File Info
 * Output		: 0 = Successful, <0 = Error
 *
 * Description	: This function does nothing but does
 * assure the file exists.
 ******************************************************/
static int do_flush(const char *path, struct fuse_file_info *fi)
{
	int retVal = -ENOENT; // Error
	int devid;
	struct d_node_s *node = NULL;

#ifdef TEST_MODE
	can_msg("do_flush: %s\n", path);
#endif

	if ((node = getPathNode(path)) != NULL)
	{
		devid = getDevID(path);

		if (node->fflags & ff_open)
		{
			if (node->fflags & ff_dirty)
			{
				writeFileObject(devid, (o_node *) node->data);
				node->fflags &= ~ff_dirty;
			}

			retVal = 0;
		}
	}

	return retVal;
}

int do_mknod(const char* path, mode_t mode, dev_t rdev) { return -EACCES; }
int do_mkdir(const char* path, mode_t mode) { return -EACCES; }
int do_unlink(const char* path) { return -EPERM; }
int do_rmdir(const char* path) { return -EACCES; }
int do_symlink(const char* to, const char* from) { return -EXDEV; }
int do_rename(const char* from, const char* to) { return -EACCES; }
int do_link(const char* from, const char* to) { return -EXDEV; }
int do_chmod(const char* path, mode_t mode) { return -EACCES; }
int do_chown(const char* path, uid_t uid, gid_t gid) { return -EACCES; }
int do_truncate(const char* path, off_t size) { return 0; }
int do_ftruncate(const char* path, off_t size, struct fuse_file_info *fi) { return -EACCES; }
int do_utimens(const char* path, const struct timespec ts[2]) { return -ENOENT; }
int do_statfs(const char* path, struct statvfs* stbuf) { return -ENOENT; }
int do_fsync(const char* path, int isdatasync, struct fuse_file_info* fi) { return -ENOENT; }
int do_ioctl(const char* path, int cmd, void* arg, struct fuse_file_info* fi, unsigned int flags, void* data) { return -ENOENT; }

/* FUSE operation structure */

static struct fuse_operations operations = {
    .getattr	= do_getattr,
	.fgetattr   = do_fgetattr,
    .read		= do_read,
	.open		= do_open,
	.rename		= do_rename,
	.release	= do_release,
	.write		= do_write,
	.flush		= do_flush,
	.truncate   = do_truncate,
	.opendir	= do_opendir,
	.readdir	= do_readdir,
	.rmdir		= do_rmdir,
	.mkdir		= do_mkdir,
	.releasedir	= do_releasedir,
	.fsyncdir	= do_fsyncdir,
	.ftruncate  = do_ftruncate,
	.utimens    = do_utimens,
	.chmod      = do_chmod,
	.chown      = do_chown,
	.statfs     = do_statfs,
	.mknod		= do_mknod,
	.unlink		= do_unlink,
	.symlink	= do_symlink,
	.link		= do_link,
	.ioctl		= do_ioctl,
	.flag_nullpath_ok = 0,
	.flag_utime_omit_ok = 0,
};

/******************************************************
 * Function		: branchFileSys
 * Input		: None
 * Output		: None
 *
 * Description	: This function starts the file system using
 * FUSE.  It does NOT return.  Remove "-f" as a parameter to
 * allow it to run AND return if necessary.
 ******************************************************/
void branchFileSys(char *mountpt)
{
	int argc = 3;
	char *argv[3];
	char pname[] = ONYXX_CLASS;
	char opt[] = "-f"; // Force foreground

	argv[0] = pname;
	argv[1] = opt;
	argv[2] = mountpt;

	/* Spawn off the FUSE file structure followed by the onyxx CAN listener. */

	fuse_main(argc, argv, &operations, NULL);

	can_msg("Exiting...\n");
	return;
}

