#include "memmgr.h"
/* 
	File:				memmgr.c
	Date:				7/20/00
	Description:		
		Public domain memory manager created by BWilcutt (circa 1985).
                Provides needed malloc() and free() type functions for TINY OS and
	        local WED code.
	Original Author:	Bryan Wilcutt
*/

void               *mem_start       = NULL;
LOG_2               pool_size_log2  = 0;
unsigned long       pool_size       = 0;
unsigned long       free_count      = 0;
struct FREE_BLOCK  *avail_list_head = NULL;
unsigned long       base_size       = 0;

/***********************************************
 * Function  : initMemMgr
 * Input     : Void * to base memory to use.
 *			      Unsigned long of size of base memory in bytes.
 * Output    : None
 * Purpose   : Creates free list headers for pool.
 *             Fails if largest power of 2 minus
 *             the memory size is too small to
 *             have a free headers list.
 ***********************************************/
void
initMemMgr(void *bm, long bs)
{
   LOG_2 k;                      /* Log2 of free list header block size. */
   LOG_2 i;                      /* Loop counter. */
   unsigned long bytes_needed;   /* Potential number of little blocks. */
   struct FREE_BLOCK *free_memory;      /* Pointer to pool as giant free block. */
   struct FREE_BLOCK *avail;            /* For pointing into avail list. */
   long a;
   char *mem = bm;
   _CLI;
   base_size = bs;
   mem_start = bm;
   /* Erase contents of memory region. */
   for (a = 0; a < bs; *mem++ = 0, a++);  
   /* Compute log2 of the size of the memory pool rounded down to the
      nearest power of 2.  The value must be at least BLOCK_SIZE_LOG_2
      so the search is started there.
   */
   pool_size_log2 = BLOCK_SIZE_LOG_2;
   bytes_needed = ( base_size >> BLOCK_SIZE_LOG_2 );
   /* Get log of pool size */
   while ( bytes_needed >>= 1 ) pool_size_log2++;
   pool_size = ( 1L << pool_size_log2 );
   /* Compute log2 of the size of the free list header array rounded up to
      the nearest power of 2.  This many bytes will be pre-allocated to hold
      the free list header array.  The minimum amount that can be allocated
      is BLOCK_SIZE_LOG_2 so the search is started there. 
   */
   k = BLOCK_SIZE_LOG_2;
   bytes_needed = ( ( ( pool_size_log2 + 1 ) * sizeof( struct FREE_BLOCK ) +
      sizeof( struct USED_BLOCK ) ) * 2 - 1 ) >> BLOCK_SIZE_LOG_2;
   /* Get log of block size */
   while ( bytes_needed >>= 1 ) k++;
   /* Set up the free list header array in the lowest memory block large */
   /* enough to hold it. */
   free_memory = (struct FREE_BLOCK *)mem_start;
   free_memory->size = k | IN_USE_BIT;	/* Mark its size (and in use). */
   avail_list_head = (struct FREE_BLOCK *)
      ((char *)mem_start + sizeof( struct USED_BLOCK ));
   /* There are no free blocks smaller than the one holding the free */
   /* list headers.  Initialize all of those free lists to empty. */
   for ( i = 0, avail = avail_list_head; i < k; i++, avail++ ) {
      avail->linkf = avail;      /* Empty each free list. */
      avail->linkb = avail;
   }
   /* There is one free block of each size greater equal the one holding
      the free list headers and less than the total pool size.  Initialize
      each of these free lists to hold one block.
   */
   free_count = 0;         /* Free byte counter. */
   for ( i = k, avail = &avail_list_head[k]; i < pool_size_log2; i++, avail++ ) {
      /* Get address of free buddy */
      free_memory = (struct FREE_BLOCK *)  ((unsigned char *)mem_start + ( 1L << i ) );
      free_memory->size = i & IN_USE_MASK;
      free_memory->linkf = avail;	/* Put it in free list. */
      free_memory->linkb = avail;
      avail->linkf = free_memory;
      avail->linkb = free_memory;
      free_count += ( 1L << i );	/* Increase free byte counter. */
   }
   /* The full pool size block is not available. */
   /* Initialize that list to empty. */
   avail = &avail_list_head[pool_size_log2];
   avail->linkf = avail;		/* Empty the list. */
   avail->linkb = avail;
   /* Deviation from standard buddy system.  Use up the leftover space
      (base_size - pool_size) with blocks of various sizes which have
      no buddies.  An additional condition is necessary in the coalesce
      loop of Free_mem to recognize these "odd men out".
   */
   base_size -= pool_size;    /* Leftover space. */
   /* Point to after main poll */
   free_memory = (struct FREE_BLOCK *) ((unsigned char *)mem_start + pool_size );
   /* Iterate until too small to use. */
   while ( base_size >= BLOCK_SIZE ) {
      i = BLOCK_SIZE_LOG_2;		/* Compute largest block which fits. */
      bytes_needed = ( base_size >> BLOCK_SIZE_LOG_2 );
      /* Increment log of it */
      while ( bytes_needed >>= 1 ) i++;
      
      avail = &avail_list_head[i];	/* Add to appropriate free list. */
      free_memory->size = i & IN_USE_MASK;
      free_memory->linkf = avail->linkf;
      avail->linkf->linkb = free_memory;
      free_memory->linkb = avail;
      avail->linkf = free_memory;
      free_count += ( 1L << i );	/* Increase free byte counter. */
      pool_size += ( 1L << i );		/* Increase total pool_size. */
      base_size -= ( 1L << i );		/* Prepare for next loop. */
      free_memory = (struct FREE_BLOCK *) ( (unsigned char *)free_memory + ( 1L << i ) );
   }
   _STI;
}

/***********************************************
 * Function  : allocMem
 * Input     : Bytes requested
 * Output    : Memory pointer, NULL if failed.
 * Purpose   : Allocates memory using the buddy system
 *             as defined by Donald Knuth in "The
 *             Art of Computer Programming" Vol I.
 ***********************************************/
void *
allocMem(unsigned int bytes_needed)
{
   LOG_2 k;               /* Log2 of the requested size. */
   LOG_2 j;               /* Likewise for larger split blocks. */
   void *mem_address;     /* Address to return to user. */
   struct FREE_BLOCK *l;         /* Pointer to block found for user. */
   struct FREE_BLOCK *p;         /* Its buddy. */
   struct FREE_BLOCK *avail;     /* Pointer into avail list headers. */
   /* FIX #6: Added explicit 'int' type; implicit int was removed in C99. */
   register int adx;
   _CLI;
   if ( bytes_needed == 0 )    /* Validate minimum request size. */
      mem_address = NULL;      /* Garbage in, garbage out. */
   else {
      /* Pseudovariable	Replaces		Scope
         --------------	--------		-----
         adx      LOG_2 j        Until interrupt lockout.
	  */
      bytes_needed += sizeof( struct USED_BLOCK );     /* Add in internal overhead. */
      bytes_needed <<= 1;		        /* Round up to next power of 2. */
      bytes_needed--;			        /* In case it was a power of 2. */
      bytes_needed >>= BLOCK_SIZE_LOG_2;/* Ensure minimum size. */
      adx = BLOCK_SIZE_LOG_2;           /* Start counting there. */
      /* Halve block size and increment log2 count. */
      while ( bytes_needed >>= 1 ) adx++;
      j = adx;          /* Likewise for all splits needed. */
      k = j;            /* Log2 of block size to give user. */
      avail = &avail_list_head[j];	/* Calculate pointer into free list. */
      /* Knuth, R1.  [Find Block.]  ( of size k or greater ) */
      while ( ( avail->linkf == avail ) && ( j <= pool_size_log2 ) )  {
         j++;             /* Go to next larger free list. */
         avail++;         /* Advance free list header pointer. */
      }
      if ( j > pool_size_log2 )  /* Go out of bounds? */
         mem_address = NULL;     /* Yes, not enough memory available. */
      else {
    /* Knuth, R2.  [Remove From List.] */
         l = avail->linkf;      /* L <- AVAILF[j] */
         avail->linkf = l->linkf;  /* AVAILF[j] <- LINKF(L) */
         l->linkf->linkb = avail;  /* LINKB(LINKF(L)) <- LOC(AVAIL[j]) */
         l->size = k | IN_USE_BIT; /* Mark in use. */
         mem_address = (void *)  /* Calculate user's pointer. */
           ((unsigned char *)l + sizeof( struct USED_BLOCK ));
         free_count -= ( 1 << k ); /* Adjust free count. */
         while ( j > k ) {   /* Knuth, R3.  [ Split Required? ] */
            /* Knuth, R4.  [ Split. ] */
            j--;                /* Will be smaller size. */
            avail--;            /* Retreat free list header pointer. */
            p = (struct FREE_BLOCK *)  /* Get pointer to larger free block. */
             ((char *)l + ( 1L << j ));   /* P <- L + 2^j */
            p->size = j;        /* Halve size. (not in use) */
            p->linkf = avail;   /* LINKF(P) <- LOC(AVAIL[j]) */
            p->linkb = avail;   /* LINKB(P) <- LOC(AVAIL[j]) */
            avail->linkf = p;   /* AVAILF[j] <- P */
            avail->linkb = p;   /* AVAILB[j] <- P */
         }
      }
      /******** INTERRUPT LOCKOUT ENDS HERE. ***********/
   } /* end if valid request */
   _STI;
   return ( mem_address );
}

/***********************************************
 * Function  : deallocMem
 * Input     : Memory pointer
 * Output    : None
 * Purpose   : Frees previously allocated buddy
 *             as defined by Donald Knuth in "The
 *             Art of Computer Programming" Vol I.
 ***********************************************/
void
deallocMem(void *memory)
{
   unsigned long block_size;  /* Actual size of block freeing. */
   LOG_2 k;                   /* Log2 of block_size. */
   struct FREE_BLOCK *l;			  /* Pointer to block freeing. */
   struct FREE_BLOCK *p;			  /* Pointer to its buddy. */
   struct FREE_BLOCK *avail;
   /* Range check the pointer. */
   _CLI;
   if (((unsigned char *)memory >= (unsigned char *)mem_start) &&
      ((unsigned char *)memory < ((unsigned char *)mem_start + pool_size ))) {
      /* Compute start and size of block to be freed. */
      l = (struct FREE_BLOCK *)		/* Calculate pointer to block header. */
         ((unsigned char *)memory - sizeof( struct USED_BLOCK ));
      k = l->size;                 /* Read size and in use bit. */
      if ( IN_USE( k ) ) {         /* Check for in use mark. */
                                   /*    (k is local variable). */
         SET_NOT_IN_USE( k );      /* Clear in use bit. */
         block_size = ( 1L << k ); /* Calculate block size. */
         free_count += block_size; /* Adjust free count. */
         while (1) {               /* Will break from middle of loop. */
            /* Compute address of l's buddy (p) by:
                  1. Subtracting off mem_start to get 0 based address.
                  2. Toggling the bit which represents the block size.
                  3. Adding back mem_start to get true memory address.
			*/
            p = (struct FREE_BLOCK *) ( (unsigned char *)mem_start +
              (((unsigned char *)l - (unsigned char *)mem_start) ^ block_size));
            /* Knuth, S1.  [ Is buddy available? ]
               FIX #2: Range check was incorrectly using 'memory' (the original
               user pointer, already validated above) instead of 'p' (the
               candidate buddy block). Changed both checks to use 'p'.
            */
            if ( ( k >= pool_size_log2 ) ||
              ((unsigned char *)p < (unsigned char *)mem_start ) ||
              ((unsigned char *)p >=
              ((unsigned char *)mem_start + pool_size ) ) ||
              (p->size != k))      /* if block unused, but size not EQ. */
               break;              /* Then cannot combine further. */
            else {
               /* Knuth, S2.  [ Combine with buddy ]. */
               /* (This removes block P from the AVAIL[k] list.) */
               p->linkb->linkf = p->linkf;  /* LINKF(LINKB(P)) <- LINKF(P) */
               p->linkf->linkb = p->linkb;  /* LINKF(LINKF(P)) <- LINKB(P) */
               if ( p < l ) {               /* Which buddy is on the left? */
                  l->size = k;              /* Mark right buddy free. */
                  l = p;                    /* Make sure l points to it. */
               }
               k++;                         /* Prepare to add to larger free list. */
               block_size <<= 1;            /* Double size of free block. */
            }
         }
         /* Knuth, S3.  [ Put largest free block on list. ] */
         /* (This puts block L on the AVAIL[k] list.) */
         avail = (struct FREE_BLOCK *)&avail_list_head[k];
         l->size = k & IN_USE_MASK;        /* Record size. */
         l->linkf = avail->linkf;          /* LINKF(L) <- AVAILF[k] */
         avail->linkf->linkb =             /* LINKB(AVAILF[k]) <- L */
           (struct FREE_BLOCK *)l;
         l->linkb = avail;                 /* LINKB(L) <- LOC(AVAIL[k]) */
         avail->linkf = (struct FREE_BLOCK *)l;   /* AVAILF[k] <- L */
      }
   }
   _STI;
}

/***********************************************
 * Function  : callocMem
 * Input     : Number of members
 *             Size of each member
 * Output    : NULL if failure, pointer otherwise
 * Purpose   : Allocates a zeroed block for an array.
 ***********************************************/
void *
/* FIX #5: Changed params from int to size_t to prevent signed overflow. */
callocMem(size_t m, size_t s)
{
   size_t total;
   char *ptr;
   size_t i;
   /* FIX #5: Guard against integer overflow in m * s. */
   if ( s != 0 && m > (size_t)-1 / s )
      return NULL;
   total = m * s;
   /* FIX #8: Validate input. */
   if ( total == 0 )
      return NULL;
   ptr = (char *)allocMem((unsigned int)total);
   /* FIX #3: Zero the allocated block to match calloc() contract.
      allocMem does not guarantee zeroed memory. */
   if ( ptr != NULL ) {
      for ( i = 0; i < total; i++ )
         ptr[i] = 0;
   }
   return ptr;
}

/***********************************************
 * Function  : reallocMem
 * Input     : Memory pointer of original memory
 *             Size of new block.
 * Output    : NULL if failure, pointer otherwise
 * Purpose   : Frees previously allocated buddy
 *             as defined by Donald Knuth in "The
 *             Art of Computer Programming" Vol I.
 ***********************************************/
void *
reallocMem(void *m, int s)
{
   char *retVal = NULL;
   unsigned int old_size;
   unsigned int copy_size;
   unsigned int a;
   /* FIX #8: Validate input size. */
   if ( s <= 0 )
      return NULL;
   /* Buddy system cannot actually resize a block, so we are forced to
      allocate new memory, copy the old memory to the new memory, then
      dealloc the old memory.
   */
   if ((retVal = (char *)allocMem(s)) != NULL)
   {
      old_size = blockSize(m);
      /* FIX #1: Was (blockSize(m) < s) ? s : blockSize(m) which copied
         the LARGER of the two sizes, reading past the end of the old
         block when shrinking.  Must copy the SMALLER (min) of the two. */
      copy_size = (old_size < (unsigned int)s) ? old_size : (unsigned int)s;
      for (a = 0; a < copy_size; a++)
         retVal[a] = ((char *)m)[a];
      /* FIX #4: Zero-fill any bytes beyond the original size when growing,
         so callers don't receive uninitialized heap data. */
      for ( ; a < (unsigned int)s; a++)
         retVal[a] = 0;
      deallocMem(m);
   }
   return retVal;
}

/***********************************************
 * Function  : blockSize
 * Input     : Memory pointer
 * Output    : Size of block in bytes, 0 if failed
 * Purpose   : Returns the actual size of a block which
 *             was allocated with allocMem.
 ***********************************************/
unsigned int
blockSize(void *memory)
{
   struct FREE_BLOCK *l;               /* Pointer to block in question. */
   LOG_2 k;                     /* Log2 of its size. */
   unsigned int block_size = 0; /* Return value. */
   /* Range check the pointer. */
   if (((unsigned char *)memory >= (unsigned char *)mem_start) &&
      ((unsigned char *)memory < ((unsigned char *)mem_start + pool_size))) {
      l = (struct FREE_BLOCK *) ((unsigned char *)memory - sizeof( struct USED_BLOCK ));
      k = l->size;
      if (IN_USE(k)) {
         SET_NOT_IN_USE( k );
         block_size = ( ( 1 << k ) - sizeof( struct USED_BLOCK ) );
      }
   }
   return (block_size);
}

/***********************************************
 * Function  : freeCount
 * Input     : None
 * Output    : Number of bytes available
 * Purpose   : Returns free mem availability.
 ***********************************************/
unsigned long
freeCount()
{
   return( free_count );
}

