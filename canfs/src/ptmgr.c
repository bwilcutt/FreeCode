/*
 * Program		: Onyxx CAN File System (OCANFS)
 * Author		: Bryan Wilcutt
 * Date			: 7/31/2016
 * File			: ptmgr.c
 *
 * About:
 *
 * This file contains the necessary code to manage data points.
 */

#include "ptmgr.h"
#include "dirmgr.h"
#include <sys/time.h>
#include <netinet/in.h>

o_device deviceArray[MAX_DEVICES];

/******************************************************
 * Function		: getDevIDbyMAC
 * Input		: Pointer to MAC buffer
 * 				  size of MAC buffer
 * Output		: -2 = Bad MAC
 * 			      -1 = Good MAC but ID not found
 * 				   >=0 = Device ID
 *
 * Returns the matching device ID based on frame's assumed
 * MAC address.  It is assumed MAC address begins with
 * LYNXSPRING UID (0x98 0xf0 0x58).
 ******************************************************/
int getDevIDbyMAC(uint8_t *mac)
{
	int retVal = MAC_UNKNOWN;
	struct d_node_s *p = systemParent;
	uint pmac[3];

	/* Traverse our device tree and find a match with frame's given MAC and
	 * tree entries.   We assume the first 6 bytes of the frame's data field
	 * points to a MAC address.
	 */

#ifdef TEST_MODE
	can_msg("getDevIDbyMAC(%02x:%02x:%02x)\n", mac[0], mac[1], mac[2]);
#endif

	if (mac)
	{
		/* Go through directory and find a matching entry using this MAC. If found,
		 * return the index. */

		while (p && retVal == MAC_UNKNOWN)
		{
			if (sscanf(p->name, ONYXX_CLASS "_%02x%02x%02x", &pmac[0], &pmac[1], &pmac[2]) == 3)
			{
				if ((pmac[0] == (int) mac[0]) && (pmac[1] == (int) mac[1]) && (pmac[2] == (int) mac[2]))
				{
					if (p->data)
					{
						retVal = ((o_device *) p->data)->idfile.data.id;
					}
				}
			}

			p = p->next;
		}
	}

	return retVal;
}

/******************************************************
 * Function		: allocDevID
 * Input		: None
 * Output		: -1  = Out of device entries
 * 			      >=2 = Device ID allocated
 * Description  : Finds and initializes a new device
 * entry in the deviceArray.  Returns -1 if no more are
 * available.  Not device ID of 0 or 1 is allowed
 * in ocan protocol, those IDs are reserved.  When using
 * a device ID in a CAN message, make sure +2 is added.
 ******************************************************/
int allocDevID()
{
	int retVal = MAC_UNKNOWN;
	int i;

	for (i = 0; i < MAX_DEVICES && retVal == MAC_UNKNOWN; i++)
	{
		if (deviceArray[i].idfile.data.id == MAC_UNKNOWN)
			retVal = i;
	}

	return retVal;
}

/******************************************************
 * Function		: updatePoint
 * Input		: Frame pointer to update from
 * 			  	  Frame receive time stamp
 * Output		: CMD_SUCCESS | CMD_FAILURE
 *
 * Description	: Updates a CAN entry based on the
 * given frame.  Returns SUCCESS if entry is updated,
 * FAILURE if entry is not within ID range.
 ******************************************************/
void updatePoint(struct can_frame *frame, struct timeval tv)
{
	uint32_t did;
	int pt = 0;
	struct timeval tm;
	unsigned long long tvs;
	char tmp[30];
	uint16_t v;

	/* Save the data value */

	if (frame)
	{
		did = frame->can_id; /* First 2 CAN IDs are reserved for commands, host is actually #2 */

		if (did >= 0 && did < MAX_DEVICES)
		{
			/* Is this device valid? */

			if (deviceArray[did].idfile.data.id != MAC_UNKNOWN)
			{
				/* Index to the right array entry for this point. */

				/* If this is a SETALL, set up for looping multiple times, else set up for 1 iteration. */


				pt = GET_FRAME_CHANNEL(frame->data[0]);

				switch (GET_FRAME_TYPE(frame->data[0]))
				{
					case pt_d0:
						if (pt >= 0 && pt < MAX_D0)
						{
#ifdef TEST_MODE
							can_msg("ocanfs: update d.%d\n", pt);
#endif
							deviceArray[did].d_points[pt].data.c = frame->data[1] ? 1 : 0;
							memcpy(&deviceArray[did].d_points[pt].tm, &tv, sizeof(struct timeval));
						}
						break;

					case pt_a0:
						if (pt >= 0 && pt < MAX_A0)
						{
#ifdef TEST_MODE
							can_msg("ocanfs: update a.%d\n", pt);
#endif
							memcpy((uint8_t *) &v, &frame->data[1], sizeof(uint16_t));

							deviceArray[did].a_points[pt].data.i = ntohs(v);
							memcpy(&deviceArray[did].a_points[pt].tm, &tv, sizeof(struct timeval));

							// Update the size of the file as if it were ASCII.  If we don't do this,
							// fuse doesn't work right.

							deviceArray[did].a_points[pt].msize = sprintf(tmp, "%u", ntohs(v));
						}
						break;

					case pt_ui:
						if (pt >= 0 && pt < MAX_UI)
						{
#ifdef TEST_MODE
							can_msg("ocanfs: update u.%d\n", pt);
#endif
							memcpy((uint8_t *) &v, &frame->data[1], sizeof(uint16_t));

							deviceArray[did].u_points[pt].data.i = ntohs(v);
							memcpy(&deviceArray[did].u_points[pt].tm, &tv, sizeof(struct timeval));

							// Update the size of the file as if it were ASCII.  If we don't do this,
							// fuse doesn't work right.

							deviceArray[did].u_points[pt].msize = sprintf(tmp, "%u", ntohs(v));
						}
						break;

					case pt_mode:
						if (pt >= 0 && pt < MAX_UI)
						{
#ifdef TEST_MODE
							can_msg("ocanfs: update u.%d mode\n", pt);
#endif
							switch(GET_FRAME_DATA8(frame->data))
							{
								default:
								case ONYXX_MODE_RESISTANCE_V:
									deviceArray[did].m_points[pt].data.c = (uint8_t) GET_FRAME_DATA8(frame->data);
									deviceArray[did].m_points[pt].msize = sizeof(ONYXX_MODE_RESISTANCE);
									break;

								case ONYXX_MODE_VOLTAGE_V:
									deviceArray[did].m_points[pt].data.c = (uint8_t) GET_FRAME_DATA8(frame->data);
									deviceArray[did].m_points[pt].msize = sizeof(ONYXX_MODE_VOLTAGE);
									break;

								case ONYXX_MODE_CURRENT_V:
									deviceArray[did].m_points[pt].data.c = (uint8_t) GET_FRAME_DATA8(frame->data);
									deviceArray[did].m_points[pt].msize = sizeof(ONYXX_MODE_CURRENT);
									break;
							}

							memcpy(&deviceArray[did].m_points[pt].tm, &tv, sizeof(struct timeval));
						}
						break;

					default:
#ifdef TEST_MODE
						can_msg("ocanfs: unknown type (%d)\n", pt);
#endif
						break;
				}

				/* Update the epoch time stamp indicating the current epoch time (ms) that this
				 * device was written. */

				gettimeofday(&tm, NULL);
				tvs = tm.tv_sec * 1000 + tm.tv_usec / 1000;

				deviceArray[did].statfile.data.ts = tvs;
			} else {
				/* This device does not exist.  Ignore */

#ifdef TEST_MODE
				can_msg("Warning, writing to point on non-existing device (%d), ignored.\n", did);
#endif
			}
		}
	}
}

/******************************************************
 * Function		: getNode
 * Input		: Char pointer to file path
 * Output		: Node used by given path or NULL if not found.
 *
 * Description	: Traverses tree and returns the node associated
 * to the given file path.  ASSUMES PATH IS A FILE AND NOT
 * A DIRECTORY.  ASSUMES PATH IS CORRECT.
 ******************************************************/
o_node *getNode(const char *path)
{
	o_node *retVal = NULL;
	int devid;
	int idx;
	pointtype_e typ;

	/* Find the file indicator of "d.x", "a.x" or "u.x" where
	 * x indicates a number within the proper range of the
	 * given data type.
	 */

	if ((devid = getDevID(path)) >= 0)
	{
		if (getPointDir(devid, path, &idx, &typ))
		{
			retVal = getPointFile(devid, path, idx, typ);
		}
	}

	return retVal;
}

/******************************************************
 * Function		: getPointDir
 * Input		: Int value of device
 * 				  Char * to path
 * 				  Int * to returned index value of point
 * 				      (-1 if not found)
 * 				  pt_e * to returned type of point (a0, d0,
 * 				      ui, pt_unknown if not found)
 * Output		: 1 = Point found, 0 = Point not found
 *
 * Description	: Traverses tree and finds the matching point
 * indicated in the given path.
 ******************************************************/
int getPointDir(int devid, const char *path, int *idx, pointtype_e *typ)
{
	int retVal = 0; // Failure
	char *ptr;
	int id;

	*idx = -1;
	*typ = pt_unknown;

	if (path)
	{
		if ((ptr = strstr(path, "d.")) != NULL)
		{
			if (sscanf(ptr, ONYXX_D0_PT_SUBDIR, &id) == 1)
			{
				if (id >= 0 && id < MAX_D0)
				{
					*idx = id;
					*typ = pt_d0;
					retVal = 1; // Success
				}
			}
		} else if ((ptr = strstr(path, "a.")) != NULL) {
			if (sscanf(ptr, ONYXX_A0_PT_SUBDIR, &id) == 1)
			{
				if (id >= 0 && id < MAX_A0)
				{
					*idx = id;
					*typ = pt_a0;
					retVal = 1; // Success
				}
			}
		} else if ((ptr = strstr(path, "u.")) != NULL) {
			if (sscanf(ptr, ONYXX_UI_PT_SUBDIR, &id) == 1)
			{
				if (id >= 0 && id < MAX_UI)
				{
					*idx = id;
					*typ = pt_ui;
					retVal = 1; // Success
				}
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: getPointFile
 * Input		: Int index of device to search
 * 				  Char * to current path in question
 * 				  Int to point index
 * 				  pt_e point type
 * Output		: Found node * or NULL if not found.
 *
 * Description	: Traverses tree and returns the VALUE node
 * pointer indicated by the given path, NULL if not found.
 ******************************************************/
o_node *getPointFile(int devid, const char *path, int idx, pointtype_e typ)
{
	o_node *retVal = NULL;
	char *ptr;

	if ((ptr = strrchr(path, '/')) == NULL)
		ptr = (char *) path;
	else
		ptr++;

	if (strcmp(ptr, ONYXX_VALUE_FILE) == 0)
	{
		switch(typ)
		{
			case pt_a0:
				retVal = &deviceArray[devid].a_points[idx];
				break;

			case pt_d0:
				retVal = &deviceArray[devid].d_points[idx];
				break;

			case pt_ui:
				retVal = &deviceArray[devid].u_points[idx];
				break;

			default:
				retVal = NULL;
				break;
		}
	} else if (strcmp(ptr, ONYXX_MODE_FILE) == 0 && typ == pt_ui) {
		retVal = &deviceArray[devid].m_points[idx];
	}

	return retVal;
}

/******************************************************
 * Function		: getDevID
 * Input		: Char pointer to file path
 * Output		: -1 = ID Not found
 *                >= 0 = Device ID
 *
 * Description	: Obtains the device ID from the path and
 * returns it.  The device was be an active entry.
 ******************************************************/
int getDevID(const char *path)
{
	int retVal = MAC_UNKNOWN;
	struct d_node_s *obj;

	if (path)
	{
		if ((obj = getPathNode(path)) != NULL)
		{
			/*Crawl up to the top most directory node and that'll be the device entry. */

			while (obj->parent != NULL)
				obj = obj->parent;

			if (obj)
				retVal = ((o_device *)obj)->idfile.data.id;
		}
	}

	return retVal;
}

void dump_node(char *header, o_node *node)
{
	int i;

	if (node && header)
	{
		can_msg("\n\n----- %s -----\n", header);

		can_msg("Addr: 0x%08X\n", node);
		can_msg("Type: ");
		if (node->typ == pt_unknown)
			can_msg("pt_unknown");
		else if (node->typ == pt_d0)
			can_msg("pt_d0");
		else if (node->typ == pt_a0)
			can_msg("pt_a0");
		else if (node->typ == pt_ui)
			can_msg("pt_ui");
		else if (node->typ == pt_mode)
			can_msg("pt_mode");

		can_msg("\nPoint #: %d\n", node->pt);
		can_msg("Time: %lu\n", node->tm.tv_sec);

		can_msg("\nSize: %d\n", node->msize);

		can_msg("Data: ");

		for (i = 0; i < 6; i++)
		{
			can_msg("%02x ", node->data.raw[i]);
		}

		can_msg("\n");
	}

	return;
}

