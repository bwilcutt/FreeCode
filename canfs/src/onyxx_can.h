/*
 * Program		: Onyxx CAN File System (OCANFS)
 * Author		: Bryan Wilcutt
 * Date			: 7/31/2016
 * File			: onyxx_can.h
 *
 * About:
 *
 * The Onyxx FUSE File System for CAN (o_can) monitors the CAN bus (c_can) for activity belonging to the Onyxx device.
 * This file contains definitions and external references used by the whole system.
 */

#ifndef _UIO_CAN_H
#define _UIO_CAN_H

#define FUSE_USE_VERSION 30  // Define BEFORE calling #include <fuse.h>

/* Set TEST_MODE to turn on debug output and log file. */
//#define TEST_MODE

#include <stdlib.h>
#include <sys/types.h>
#include <stdio.h>
#include <dirent.h>
#include <libgen.h>
#include <fuse.h>
#include <errno.h>
#include <stdarg.h>
#include <pthread.h>
#include <string.h>
#include <malloc.h>
#include <unistd.h>
#include <net/if.h>
#include <memory.h>
#include <limits.h>
#include <dirent.h>
#include <sys/ioctl.h>
#include <linux/poll.h>
#include <linux/types.h>
#include <linux/socket.h>
#include <linux/ioctl.h>
#include <linux/sockios.h>
#include <linux/can.h>
#include <linux/can/raw.h>
#include <linux/net.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <netinet/in.h>

#define MAXSOCK 16    /* max. number of CAN interfaces given on the cmdline */
#define MAXIFNAMES 30 /* size of receive name index to omit ioctls */
#define ANYDEV "any"  /* name of interface to receive from any CAN interface */

/* Onyxx 534 fsys Attributes */

#define ONYXX_CLASS         "onyxx"
#define ONYXX_SUBDIR       	"534"
#define ONYXX_D0_SUBDIR    	"d0"
#define ONYXX_A0_SUBDIR    	"a0"
#define ONYXX_UI_SUBDIR    	"ui"
#define ONYXX_D0_PT_SUBDIR	"d.%d"
#define ONYXX_A0_PT_SUBDIR	"a.%d"
#define ONYXX_UI_PT_SUBDIR	"u.%d"
#define ONYXX_MODE_FILE		"mode"
#define ONYXX_MAC_FILE 		"id"
#define ONYXX_VALUE_FILE	"value"
#define ONYXX_PINGSTAT_FILE	"ping_status"

#define ONYXX_MODE_RESISTANCE "resistance"
#define ONYXX_MODE_VOLTAGE    "voltage"
#define ONYXX_MODE_CURRENT	  "current"

#define ONYXX_MODE_RESISTANCE_V 1
#define ONYXX_MODE_VOLTAGE_V	2
#define ONYXX_MODE_CURRENT_V	3

#define DEVICE_ID_UNUSED		(-1) // Indicates a device has not been allocated by the device manager.

#define US_TO_MS	(1000)		// Number of microseconds in a millisecond
#define POINT_MS_DELAY(m) (US_TO_MS * m) // Number of microseconds to wait between updating each point to the can bus.

#define CAN_DEV_DIR		    "/sys/class/net"
#define MAC_FILE			"/sys/class/net/eth0/address"

/* First 3 bytes of LynxSpring UID MAC Address.  All MACS must be preceeded by this UID. */

#define LS_UID1		((unsigned char) 0x98)
#define LS_UID2		((unsigned char) 0xf0)
#define LS_UID3		((unsigned char) 0x58)

/* Onyxx Provides 10 x D0, 8 x A0 and 16 X UI interfaces. */

#define MAX_D0 		10
#define MAX_D0_DATA_SIZE 2

#define MAX_A0		8
#define MAX_A0_DATA_SIZE 2

#define MAX_UI		16
#define MAX_UI_DATA_SIZE 2

#define MAX_MAC_DATA_SIZE 17 // When converted to a string xx:xx:xx:xx:xx:xx
#define MAX_MAC_SIZE 3      // When stored as byte data
#define MAX_IDFILE_DATA_SIZE 1		// Size of Device ID

#define MAX_MODE_DATA_SIZE 1
#define MAX_STATFILE_DATA_SIZE 28

#define MAX_DEVICES 16
#define MAC_SIZE 3
#define MODE_SIZE 11 /* Represents maximum setting but in reality we only store a single byte value */

#define MAX_DATA_STORAGE 6 /* # of bytes to locally storage from CAN messages */

#define TOUPPER(CH) (((CH) >= 'a' && (CH) <= 'z') ? ((CH) - 'a' + 'A') : (CH))

typedef enum {
        STATUS_UNKNOWN = 0,
        STATUS_ACTIVE,
        STATUS_INACTIVE
} dev_status_e;

extern void can_msg(const char *fmt, ...);
extern void branchFileSys(char *);
extern int getDevID(const char *path);
extern int strnicmp (const char *s1, const char *s2, int len);

#endif
