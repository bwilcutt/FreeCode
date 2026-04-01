/* 
	File:				memmgr.h
	Date:				7/20/00
	Description:		
		Public domain memory manager created by BWilcutt (circa 1985).
      Provides needed malloc() and free() type functions for TINY OS and
	   local WED code.
	Original Author:	Bryan Wilcutt
*/

#ifndef memmgr_h
#define memmgr_h
#include <stdio.h>
#include <stdlib.h>

/* The high bit of the size (log2) field is called the "in use bit".  It is
   set to mark a block as in-use, cleared to mark a block as available.
   The following macros assist in manipulating the in-use bit.
   The minimum block size must be a power of 2 large enough to hold the
   overhead data in a free block (sizeof(FREE_BLOCK)).
*/

#define BLOCK_SIZE_LOG_2	4	/* 2 ^ 4 = 16 bytes */
#define BLOCK_SIZE		( 1 << BLOCK_SIZE_LOG_2 )
#define IN_USE_BIT         0x8000
#define IN_USE_MASK        (~IN_USE_BIT)
#define IN_USE(x)          ((x) & IN_USE_BIT)
#define SET_IN_USE(x)		((x) |= IN_USE_BIT)
#define SET_NOT_IN_USE(x)	((x) &= IN_USE_MASK)
#define CL_SHUTDOWN   2
#define CL_AUTOREMOVE 1

/* Define MEMRTOS if this memory manager is to be used in a real time, pre-emptive
   operation.  Otherwise, for round robin applications or single threaded applications,
   it isn't necessary to be able to turn interrupts on and off.
*/

#ifdef MEMRTOS
#define _CLI
	/* Code to block execution of higher priority tasks */
#define _STI
	/* Code to unblock execution of higher priority tasks, reversing _CLI above */
#else
#define _CLI
#define _STI
#endif

/* In the exponential buddy system, all block sizes are a power of 2.
   To make efficient use of bits, the log base 2 of the size is stored
   instead of the actual size.  To compute the actual size, raise 2 to
   the stored size (1 << LOG_2).
*/

typedef uint LOG_2;

/* Free memory blocks are kept on circular doubly-linked lists, one for each
   block size.  Each header is actually a member of the list which may not be
   allocated. An empty list is signified by a header block which points only
   to itself.
*/

struct FREE_BLOCK {
   LOG_2 size;                /* Size of free block (log2). */
   struct FREE_BLOCK *linkf;         /* Next free block in list. */
   struct FREE_BLOCK *linkb;         /* Previous free block in list. */
};

/* Used memory blocks need only maintain their size and in-use bit.
   The rest of the block is available to the user.
*/

struct USED_BLOCK {
   LOG_2 size;                /* Size of used block (log2). */
};

/* API - External references */

extern void initMemMgr(void *, long);
extern void *allocMem(unsigned int bytes_needed);
extern void deallocMem(void *memory);
extern unsigned int blockSize(void *memory);
extern unsigned long freeCount(void);
extern void *reallocMem(void *, int);
extern void *callocMem(size_t, size_t);
#endif
