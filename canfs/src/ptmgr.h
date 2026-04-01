/*
 * Program		: Onyxx CAN File System (OCANFS)
 * Author		: Bryan Wilcutt
 * Date			: 7/31/2016
 * File			: ptmgr.h
 *
 * About:
 *
 * The Onyxx FUSE File System for CAN (o_can) monitors the CAN bus (c_can) for activity belonging to the Onyxx device.
 * This file containts definitions used by the ptmgr.c file.  Most data types are defined herein.
 */

#ifndef PTMGR_H_
#define PTMGR_H_

#include "onyxx_can.h"
#include "ocanid.h"

// Return vals for getMacByID()

#define MAC_UNKNOWN -1
#define MAC_BAD_UID -2

/* Identifiers used throughout program to distinguish between point types. */

typedef enum {
	pt_d0		= 0x0,
	pt_a0		= 0x1,
	pt_ui		= 0x2,
	pt_mode		= 0x3,
	pt_id		= 0x4,
	pt_stat		= 0x5,
	pt_unknown 	= 0x6,
} pointtype_e;

#define FRAME_CMD_SETONE 1
#define FRAME_CMD_SETALL
/* Define individual files/points */

typedef struct {
	union {
		uint8_t raw[6];
		uint8_t c;
		int8_t id;
		uint16_t i;
		unsigned long long ts;
	} data;

	struct timeval tm; 	// Access/create timestamp
	pointtype_e typ;
	uint8_t msize; 		// Max size is 255 bytes
	uint8_t pt;			// Element # in array (1-x, subtract 1 to get actual element in array)
} o_node;

/* Device individual devices */

typedef struct {
	o_node a_points[MAX_A0]; // All A0 Value Points
	o_node d_points[MAX_D0]; // All D0 Value Points
	o_node u_points[MAX_UI]; // All UI Value Points
	o_node m_points[MAX_UI]; // All UI Mode Points
	o_node idfile;			// Contains internal ID (index value) of this device
	o_node statfile;		// Contains last time device was written (ascii epoch)
} o_device;

extern void updatePoint(struct can_frame *frame, struct timeval tv);
extern int getDevIDbyMAC(uint8_t *mac);
extern int allocDevID();
extern int getPointDir(int devid, const char *path, int *idx, pointtype_e *typ);
extern o_node *getPointFile(int devid, const char *path, int idx, pointtype_e typ);
extern o_node *getNode(const char *path);
//extern filemode_e getFileType(const char *path, o_node **nptr);
extern int writeFileObject(int devid, o_node *node);
extern void dump_node(char *header, o_node *node);

extern o_device deviceArray[MAX_DEVICES];
#endif /* PTMGR_H_ */
