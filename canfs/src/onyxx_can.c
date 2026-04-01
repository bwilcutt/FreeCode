/*
 * Program		: Onyxx CAN File System (OCANFS)
 * Author		: Bryan Wilcutt
 * Date			: 7/31/2016
 * File			: onyxx_can.c
 *
 * About:
 *
 * The Onyxx FUSE File System for CAN (o_can) monitors the CAN bus (c_can) for activity belonging to the Onyxx device.
 * The ID's are collected from the CAN bus and extended to the FUSE file system.  The FUSE system is a mountable
 * file system for Linux, allowing this module to extend operations to CAN components for reading and writing.
 * The added benefit to using FUSE is that it can also be extended to NFS, allowing remote Onyxx devices to be
 * coalesced to a single location.  This functionality replaces DSA or DSA-like protocols while also providing a
 * robust architecture for security.
 *
 * Testing
 *
 * Define "TEST_MODE" to place unit into a test phase.  It will use vcan can simulate reading and writing.
 * The vcan driver must be installed and setup on the running platform.
 *
 * Undefine "TEST_MODE" to use "can" devices on target platform.  Again, the target platform must have socketCAN
 * installed.
 *
 * To install vcan:
 *
 * < modprobe can
 * < modprobe can_raw
 * < modprobe vcan
 * < sudo ip link add dev vcan0 type vcan
 * < sudo ip link set up vcan0
 * < ip link show vcan0
 * > vcan0: <NOARP,UP,LOWER_UP> mtu 16 qdisc noqueue state UNKNOWN link/can
 *
 * Run fuser by:
 *
 * onyxx_can <mount point>
 *
 */

#include "onyxx_can.h"
#include "ocanid.h"
#include "ptmgr.h"
#include "dirmgr.h"

const int canflag_on = 1;

static int canSocket = -1;

static struct sockaddr_can addr;
static struct ifreq ifr;
static char ctrlmsg[CMSG_SPACE(sizeof(struct timeval)) + CMSG_SPACE(sizeof(__u32))];
static char devname[255];

static volatile int reader_running = 1;
static volatile int writer_running = 1;

/* Function prototypes */

static void *onyxx_reader(void *vp);
static void *onyxx_writer(void *vp);
void can_msg(const char *fmt, ...);
static int gthIAM(struct can_frame *frame, struct timeval tv);
static void initFileSystem();
static void set_pthread_attr(pthread_attr_t *attr);
static int openCANBus();
static int readMAC(uint8_t *mac);
static void addDevice(int d, uint8_t *mac);

/******************************************************
 * Function		: main
 * Input		: Standard: argc, *argv[]
 * Output		: Returns 1 if error, 0 if exited without error
 *
 * The MAIN function branches off the CAN reader, writer and
 * FUSE filesystem.
 *
 * Call:
 *
 * onyxx_can [device] [mount point]
 ******************************************************/
int main(int argc, char *argv[])
{
	pthread_t canthread_reader;
	pthread_attr_t tattr_reader;
	pthread_t canthread_writer;
	pthread_attr_t tattr_writer;
	struct stat statbuf;
	int t;

	/* Device must be passed to this application (ig, vcan0, vcan, etc.) */

	if (argc == 3)
	{
		if (strlen(argv[1]) < sizeof(devname))
		{
			strcpy(devname, argv[1]);
		} else {
			return -ENAMETOOLONG;
		}

		/* Make sure mount point exists */

		if (stat(argv[2], &statbuf) != -1)
		{
			if (!S_ISDIR(statbuf.st_mode))
			{
				return -ENOTDIR;
			}
		}
	} else {
		can_msg("\nUsage:\nonyxx_can [vcan{n} | can{n}] [mount point]\nExample: onyxx_can vcan0 /mnt/ocanfs\n\nExiting...\n\n");
		exit(0);
	}

	initFileSystem();

	if (openCANBus() == 0)
	{
		/* Spawn off our CAN reader */

		set_pthread_attr(&tattr_reader);

		if (pthread_create(&canthread_reader, NULL, onyxx_reader, (void *)NULL) == 0)
		{
			set_pthread_attr(&tattr_writer);

			if ((t = pthread_create(&canthread_writer, NULL, onyxx_writer, (void *)NULL)) == 0)
			{
				/* Spawn off the FUSE file structure followed by the onyxx CAN listener. */

				branchFileSys(argv[2]); // Include's CAN writer.
			} else {
				can_msg("Failed to create ocanfs writer\n");
				reader_running = 0;
			}
		} else {
			can_msg("Failed to create ocanfs reader\n");
		}

		/* Wait for reader and writer to end before exiting */

		writer_running = 0;
		reader_running = 0;

		pthread_join(canthread_reader, NULL);
		pthread_join(canthread_writer, NULL);
	}

	/* Close our socket */

	if (canSocket != -1)
		close(canSocket);

	can_msg("\nocanfs: exiting...\n");

	return 0;
}

/******************************************************
 * Function		: onyxx_writer
 * Input		: Void * (ignored)
 * Output		: NULL upon catastrophic error
 *
 * This is the CAN writer for 534.  It runs in the background
 * and updates the CAN bus with UI points at a specific
 * time period.  Only created UI points are updated on created
 * devices.
 ******************************************************/
static void *onyxx_writer(void *vp)
{
	int i, d;

	/* Iterate thru all UI value points and update each to the CAN bus.  We update our
	 * values every 'COV' time.
	 */

#ifdef TEST_MODE
	can_msg("ocanfs: writer start\n");
#endif

	while (writer_running)
	{
		for (d = 0; d < MAX_DEVICES; d++)
		{
			if (((char) deviceArray[d].idfile.data.id) != -1)
			{
				/* Update points for this device based on whether they have ever been initialized.
				 * We know a point has been used at least once if it's time stamp isn't 0.
				 */

				for (i = 0; i < MAX_A0 && writer_running; i++)
				{
					if (deviceArray[d].a_points[i].tm.tv_sec != 0)
					{
						writeFileObject(d, &deviceArray[d].a_points[i]);
						usleep(POINT_MS_DELAY(400)); // Wait x milliseconds before sending next msg
					}
				}

				for (i = 0; i < MAX_D0 && writer_running; i++)
				{
					if (deviceArray[d].d_points[i].tm.tv_sec != 0)
					{
						writeFileObject(d, &deviceArray[d].d_points[i]);
						usleep(POINT_MS_DELAY(400)); // Wait x milliseconds before sending next msg
					}
				}

				for (i = 0; i < MAX_UI && writer_running; i++)
				{
					if (deviceArray[d].u_points[i].tm.tv_sec != 0)
					{
						writeFileObject(d, &deviceArray[d].u_points[i]);
						usleep(POINT_MS_DELAY(400)); // Wait x milliseconds before sending next msg
					}

					if (deviceArray[d].m_points[i].tm.tv_sec != 0)
					{
						writeFileObject(d, &deviceArray[d].m_points[i]);
						usleep(POINT_MS_DELAY(400));
					}
				}
			}
		}
	}

	can_msg("ocanfs - writer exited.\n");
	pthread_exit(NULL);
	return NULL;
}

/******************************************************
 * Function		: onyxx_reader
 * Input		: Void * (ignored)
 * Output		: NULL upon catastrophic error
 *
 * This is the man CAN monitor for 534.  It receives all
 * CAN bound messages and sorts them into the FUSE based
 * file system (/mnt/ocanfs).  It creates entries into the
 * filesys when a new point is first discovered.  It also
 * creates new onyxx entries when a new device is discovered.
 *
 * /mnt/ocanfs/onyxx_{mac} where MAC = Device MAC address
 * /mnt/ocanfs/onyxx_{mac}/a0 - All Analog points for device
 * /mnt/ocanfs/onyxx_{mac}/d0 - All Digital points for device
 * /mnt/ocanfs/onyxx_{mac}/ui - All universal input/outputs for device
 * /mnt/ocanfs/onyxx_{mac}/id - MAC Id of device onyxxN
 ******************************************************/
static void *onyxx_reader(void *vp)
{
	fd_set rdfs;
	struct iovec iov;
	struct msghdr msg;
	struct cmsghdr *cmsg;
	int nbytes;
	struct timeval tv;
	struct can_frame frame;

	/* These settings are static and can be held out of the hot path */

	iov.iov_base = &frame;
	msg.msg_name = &addr;
	msg.msg_iov =  &iov;
	msg.msg_iovlen = 1;
	msg.msg_control = &ctrlmsg;

#ifdef TEST_MODE
	can_msg("ocanfs: reader start\n");
#endif

	while (reader_running) {

		FD_ZERO(&rdfs);
		FD_SET(canSocket, &rdfs);

		tv.tv_sec = 3;
		tv.tv_usec = 0;
		if (select(canSocket + 1, &rdfs, NULL, NULL, &tv) <= 0)
		{
			continue;
		}

		/* check socket */

		if (FD_ISSET(canSocket, &rdfs))
		{
			/* these settings may be modified by recvmsg() */

			iov.iov_len = sizeof(frame);
			msg.msg_namelen = sizeof(addr);
			msg.msg_controllen = sizeof(ctrlmsg);
			msg.msg_flags = 0;

			nbytes = recvmsg(canSocket, &msg, 0);
			if (nbytes < 0)
			{
#ifdef TEST_MODE
				can_msg("ocanfs: read failed - aborting!!\n");
#endif
				continue;
			}

			if ((size_t)nbytes != sizeof(struct can_frame))
			{
#ifdef TEST_MODE
				can_msg("ocanfs: incomplete frame - aborting!!\n");
#endif
				continue; // Incomplete CAN frame
			}

			/* Retrieve ID of this received CAN msg */

			for (cmsg = CMSG_FIRSTHDR(&msg);
				 cmsg && (cmsg->cmsg_level == SOL_SOCKET);
				 cmsg = CMSG_NXTHDR(&msg,cmsg))
			{
				if (cmsg->cmsg_type == SO_TIMESTAMP)
					memcpy(&tv, CMSG_DATA(cmsg), sizeof(struct timeval));
			}

			/* React here for ID's directed at host that are commands from/to slaves. */

			if (frame.can_id == 1)
			{
				/* Host ignores ID 1 messages, these are directed at slaves and not the host. */
#ifdef TEST_MODE
				can_msg("ocanfs: strange, host recv id 1, ignoring.\n");
#endif
			} else if (frame.can_id == 0) {
#ifdef TEST_MODE
				can_msg("ocanfs: received command ");
#endif

				/* The host only handles IAM messages.  Clients handle UAR, RESET, TIME and WAY messages. */

				if (frame.data[0] == CMD_ONYXX_IAM)
				{
#ifdef TEST_MODE
					can_msg("IAM\n");
#endif
					gthIAM(&frame, tv);
				} else {
#ifdef TEST_MODE
					can_msg("unknown (%d)\n", frame.data[0]);
#endif
				}
				/* This message gets tossed at this point. */
			} else {
				/* Modify CAN ID to remove #0 and #1 so the rest of the code address properly. */

				frame.can_id -= 2;
				updatePoint(&frame, tv);
			}
		}
	}

	can_msg("ocanfs - reader exited.\n");
	pthread_exit(NULL);
	return NULL;
}

/******************************************************
 * Function		: writeFileObject
 * Input		: o_node Pointer to write
 * Output		: 0 = Failure, 1 = Success
 *
 * Writes a frame back to the CAN bus.
 ******************************************************/
int writeFileObject(int devid, o_node *node)
{
	int retVal = 1; // Default success
	struct can_frame frame;
	uint8_t ocan_frame[4];
	uint16_t v;

	memset(ocan_frame, 0, sizeof(ocan_frame));
	memset(&frame, 0, sizeof(struct can_frame));

	if (node)
	{
		/* Set up outgoing CAN message packet */

		switch (node->typ)
		{
			// 2 Byte responses

			case pt_ui:
			case pt_a0:
				/* We only update the CAN bus with mode settings for a UI point. */
				ocan_frame[0] = SET_FRAME_TYPE(ocan_frame[0], node->typ); 		// Point is A0 or D0
				ocan_frame[0] = SET_FRAME_COMMAND(ocan_frame[0], CMD_ONYXX_SETONE);	// Command is SET ONE
				ocan_frame[0] = SET_FRAME_CHANNEL(ocan_frame[1], node->pt);		// Channel is point number
				v = htons(node->data.i);
				memcpy(&ocan_frame[1], &v, sizeof(uint16_t));

				frame.can_dlc = node->msize + 1; // Data size + 1 byte for CAN msg
				frame.can_id = devid + 2; // Recall 0 & 1 or reserved
				memcpy(frame.data, ocan_frame, sizeof(ocan_frame));
				break;

			// 1 Byte responses

			case pt_d0:
			case pt_mode:
				/* Create outgoing packet */

				ocan_frame[0] = SET_FRAME_TYPE(ocan_frame[0], node->typ); 		// Point is A0 or D0
				ocan_frame[0] = SET_FRAME_COMMAND(ocan_frame[0], CMD_ONYXX_SETONE);	// Command is SET ONE
				ocan_frame[1] = SET_FRAME_CHANNEL(ocan_frame[1], node->pt);		// Channel is point number

				ocan_frame[2] = node->data.raw[0];								// Point to raw data

				frame.can_dlc = node->msize + 1; // Data size + 1 byte for CAN msg
				frame.can_id = devid + 2; // Recall 0 & 1 or reserved
				memcpy(frame.data, ocan_frame, sizeof(ocan_frame));
				break;

			default:
				retVal = 0; // Failure, unknown point
				break;
		}

		if (retVal)
		{

#ifdef TEST_MODE
			dump_node("CAN Write", node);
#endif
			if (send(canSocket, (char *)&frame, sizeof(struct can_frame), MSG_DONTWAIT) == -1)
				retVal = 0; // Socket error, return error
		}
	}

	return retVal;
}

/******************************************************
 * Function		: gthIAM
 * Input		: ocan_id_s bit fields
 * 				  Frame pointer
 * Output		: 0 = Error, 1 = Success
 *
 * Description	: Sends a YOU ARE (UAR) message from
 * host-to-guest in response to an I am (IAM) message.
 ******************************************************/
static int gthIAM(struct can_frame *frame, struct timeval tv)
{
	int retVal = 0; // Failure default
	int devid = 0;
	int did;

	/* If the IAM device ID field is 0 then this is a fresh session.  Otherwise,
	 * it's a reply to a ping.
	 */

	did = frame->can_id;

	if (did == 0 && frame->can_dlc == 4)
	{
		/* This is a new device, or is it?   Check MAC field to see if it is
		 * already recorded in our vfs.  If it is, return the previously assigned
		 * device ID.  If it's not, assign a new device ID.
		 */

		if ((devid = getDevIDbyMAC((uint8_t *) &frame->data[1])) == MAC_UNKNOWN)
		{
			/* The ID doesn't exist.  This device is truly new.  Allocate a spot
			 * for it.
			 */

			if ((devid = allocDevID()) >= 0)
			{
				/* Device allocated. */

				addDevice(devid, &frame->data[1]);

				/* Return reply to sender using device id #1 with attached MAC address given
				 * in the IAM message.
				 */

				frame->can_id = 1;
				frame->data[0] = CMD_ONYXX_UAR | (uint8_t) devid;
				send(canSocket, (char *) frame, sizeof(struct can_frame), MSG_DONTWAIT);

				retVal = 1; // Success
			} else {
#ifdef TEST_MODE
				can_msg("ocanfs: err device table full\n");
#endif
			}
		} else {
#ifdef TEST_MODE
			can_msg("ocanfs: Device already exists (%d)\n", devid);
#endif
		}
	} else {
#ifdef TEST_MODE
		can_msg("ocanfs: IAM invalid, wrong size (%d), ignoring.\n", frame->can_dlc);
#endif
	}

	return retVal;
}

/******************************************************
 * Function		: can_msg
 * Input		: printf() style input
 * Output		: None
 *
 * Description	: Prints a message to the log file.
 ******************************************************/
void can_msg(const char *fmt, ...)
{
	va_list ap;
    va_start(ap, fmt);

    vfprintf(stdout, fmt, ap); fflush(stdout);

    va_end(ap);
}

/******************************************************
 * Function		: initFileSystem
 * Input		: None
 * Output		: None
 *
 * Description	: Initializes internal data structures.
 ******************************************************/
static void initFileSystem()
{
	uint8_t mac[6];
	int i;

	for (i = 0; i < MAX_DEVICES; i++)
	{
		memset(&deviceArray[i], 0, sizeof(o_device));
		deviceArray[i].idfile.data.id = DEVICE_ID_UNUSED;
	}

	/* Give device MAC address */

	readMAC(mac);

	/* Add Host device tree */

	addDevice(0, mac);
}

void addDevice(int d, uint8_t *mac)
{
	char tmp[512];
	char rootdir[64];
	int i;

	memset(&deviceArray[d], 0, sizeof(o_device));

	sprintf(rootdir, "/%s_%02x%02x%02x", ONYXX_CLASS, mac[0], mac[1], mac[2]);
	addMasterDirectory(rootdir);

	addFile(rootdir, "id", &deviceArray[d].idfile, 0644);
	deviceArray[d].idfile.msize = 1;
	deviceArray[d].idfile.typ = pt_id;
	deviceArray[d].idfile.data.c = d + 2;

	addFile(rootdir, "ping_status", &deviceArray[d].statfile, 0644);
	deviceArray[d].statfile.msize = MAX_STATFILE_DATA_SIZE;
	deviceArray[d].statfile.typ = pt_stat;

	for (i = 0; i < MAX_D0; i++)
	{
		sprintf(tmp, "%s/" ONYXX_D0_SUBDIR "/" ONYXX_D0_PT_SUBDIR, rootdir, i);
		addDirectory(tmp);
		addFile(tmp, ONYXX_VALUE_FILE, &deviceArray[d].d_points[i], 0644);

		deviceArray[d].d_points[i].typ = pt_d0;
		deviceArray[d].d_points[i].msize = 1;
		deviceArray[d].d_points[i].pt = i;
	}

	for (i = 0; i < MAX_A0; i++)
	{
		sprintf(tmp, "%s/" ONYXX_A0_SUBDIR "/" ONYXX_A0_PT_SUBDIR, rootdir, i);
		addDirectory(tmp);
		addFile(tmp, ONYXX_VALUE_FILE, &deviceArray[d].a_points[i], 0644);

		deviceArray[d].a_points[i].typ = pt_a0;
		deviceArray[d].a_points[i].msize = 1;
		deviceArray[d].a_points[i].pt = i;
	}

	for (i = 0; i < MAX_UI; i++)
	{
		sprintf(tmp, "%s/" ONYXX_UI_SUBDIR "/" ONYXX_UI_PT_SUBDIR, rootdir, i);
		addDirectory(tmp);
		addFile(tmp, ONYXX_VALUE_FILE, &deviceArray[d].u_points[i], 0644);
		addFile(tmp, ONYXX_MODE_FILE, &deviceArray[d].m_points[i], 0644);

		deviceArray[d].u_points[i].typ = pt_ui;
		deviceArray[d].u_points[i].msize = 1;
		deviceArray[d].u_points[i].pt = i;

		deviceArray[d].m_points[i].typ = pt_mode;
		deviceArray[d].m_points[i].msize = 0;
		deviceArray[d].m_points[i].pt = i;
	}

	return;
}

/******************************************************
 * Function		: openCANBus
 * Input		: None
 * Output		: 0 = Okay, 1 = Error, CAN no opened
 *
 * Description	: Opens I/O communication socket to the
 * CAN device.
 ******************************************************/
static int openCANBus()
{
	int retVal = 1; // Default: Error

	/* Get total number of can devices and open a socket to each. */

	canSocket = socket(PF_CAN, SOCK_RAW, CAN_RAW);

	if (canSocket < 0) {
		can_msg("ocanfs: socket() - %s\n", strerror(errno));
	} else {

		addr.can_family = AF_CAN;

		strcpy(ifr.ifr_name, devname);
		can_msg("ocanfs: using device %s\n", ifr.ifr_name);

		if (ioctl(canSocket, SIOCGIFINDEX, &ifr) < 0) {
			can_msg("ocanfs: ioctl() - %s\n", strerror(errno));
		} else {
			addr.can_ifindex = ifr.ifr_ifindex;

			/* try to switch the socket into CAN FD mode */

			if (bind(canSocket, (struct sockaddr *)&addr, sizeof(addr)) < 0)
			{
				can_msg("ocanfs: bind() - %s\n", strerror(errno));
			} else {
				retVal = 0; // Successful
			}
		}
	}

	return retVal;
}

/******************************************************
 * Function		: strnicmp
 * Input		: char * compare string 1
 *                char * compare string 2
 * Output		: < 0, 0, >0 comparison (0 = equals)
 *
 * Description	: Compares wp strings up to n chars.
 ******************************************************/
int strnicmp (const char *s1, const char *s2, int len)
{
	char c1, c2;
	int v;

	if (len == 0)
		return 0;

	do {
		c1 = *s1++;
		c2 = *s2++;
		/* the casts are necessary when pStr1 is shorter & char is signed */
		v = (unsigned int) TOUPPER(c1) - (unsigned int) TOUPPER(c2);
	} while ((v == 0) && (c1 != '\0') && (--len > 0));

	return v;
}

/******************************************************
 * Function		: set_pthread_attr
 * Input		: Pointer to raw pthread_attr_t
 * Output		: None
 *
 * Description	: Presets all requirements in the pthread
 * attribute structure to start a pthread in the
 * ocanfs system.
 ******************************************************/
static void set_pthread_attr(pthread_attr_t *attr)
{
    struct sched_param sched_param;
    void *stack_addr;
    size_t stack_size;

    pthread_attr_init(attr);

    pthread_attr_setdetachstate(attr, PTHREAD_CREATE_JOINABLE);
    pthread_attr_setscope(attr, PTHREAD_SCOPE_SYSTEM);
    pthread_attr_setinheritsched(attr, PTHREAD_INHERIT_SCHED);
    pthread_attr_setschedpolicy(attr, SCHED_RR);

    sched_param.sched_priority = 10;
    pthread_attr_setschedparam(attr, &sched_param);
    //pthread_attr_setguardsize(attr, (4096 * 4));

    stack_size = 1024 * 10;
    if (posix_memalign(&stack_addr, sysconf(_SC_PAGESIZE), stack_size) != 0)
    {
    	can_msg("ocanfs: err memalign, abort...\n");
    	exit(0);
    }

    pthread_attr_setstack(attr, stack_addr, stack_size);
}

/******************************************************
 * Function		: readMAC
 * Input		: Point to 6-byte resulting buffer
 * Output		: 0 = Failure, 1 = Success
 *
 * Description	: Reads the device's MAC address by
 * obtaining it from the sys/class directory.  This is
 * the most portable way of getting the address.
 ******************************************************/
int readMAC(uint8_t *mac)
{
	int retVal = 0; // Failure
	FILE *fp = NULL;
	uint pmac[6];

	// Get the MAC address using external function 'ip'.

	if ((fp = fopen(MAC_FILE, "r")) != NULL)
	{
		if (fscanf(fp, "%02x:%02x:%02x:%02x:%02x:%02x",	&pmac[0], &pmac[1], &pmac[2], &pmac[3], &pmac[4], &pmac[5]) == 6)
		{
			mac[0] = (uint8_t) pmac[0];
			mac[1] = (uint8_t) pmac[1];
			mac[2] = (uint8_t) pmac[2];
			mac[3] = (uint8_t) pmac[3];
			mac[4] = (uint8_t) pmac[4];
			mac[5] = (uint8_t) pmac[5];

			retVal = 1; // success
		}
	}

	if (fp)
		fclose(fp);

	return retVal;
}
