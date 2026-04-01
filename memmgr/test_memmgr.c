/*
   File:        test_memmgr.c
   Description: Exercises initMemMgr, allocMem, callocMem, reallocMem,
                deallocMem, blockSize, and freeCount.
 
   Build (example):
      cc -o test_memmgr test_memmgr.c memmgr.c
*/
#include <stdio.h>
#include <string.h>
#include "memmgr.h"
 
/* Size of the memory pool to manage. */
#define POOL_SIZE (1024 * 64)   /* 64 KB */
 
/* Simple pass/fail counters. */
static int tests_run    = 0;
static int tests_passed = 0;
 
/* ---------------------------------------------------------------
   CHECK macro: prints PASS or FAIL with the test description.
   --------------------------------------------------------------- */
#define CHECK(desc, expr)                                           \
   do {                                                             \
      tests_run++;                                                  \
      if (expr) {                                                    \
         printf("  PASS: %s\n", desc);                              \
         tests_passed++;                                            \
      } else {                                                       \
         printf("  FAIL: %s  (line %d)\n", desc, __LINE__);        \
      }                                                             \
   } while (0)
 
/* ---------------------------------------------------------------
   Static pool — provided to initMemMgr as the managed region.
   --------------------------------------------------------------- */
static unsigned char pool[POOL_SIZE];
 
/* ---------------------------------------------------------------
   Helpers
   --------------------------------------------------------------- */
 
/* Fill a block with a repeating byte value. */
static void fill_block(unsigned char *p, unsigned int len, unsigned char val)
{
   unsigned int i;
   for (i = 0; i < len; i++)
      p[i] = val;
}
 
/* Return 1 if every byte in the block equals val, 0 otherwise. */
static int check_block(const unsigned char *p, unsigned int len, unsigned char val)
{
   unsigned int i;
   for (i = 0; i < len; i++)
      if (p[i] != val)
         return 0;
   return 1;
}
 
/* Return 1 if every byte in the block is zero. */
static int check_zeroed(const unsigned char *p, unsigned int len)
{
   return check_block(p, len, 0);
}
 
/* ---------------------------------------------------------------
   Test groups
   --------------------------------------------------------------- */
 
static void test_init(void)
{
   printf("\n--- Init ---\n");
   initMemMgr(pool, POOL_SIZE);
   CHECK("freeCount > 0 after init",            freeCount() > 0);
   CHECK("freeCount <= POOL_SIZE after init",   freeCount() <= POOL_SIZE);
   printf("    freeCount = %lu bytes\n",        freeCount());
}
 
static void test_alloc(void)
{
   unsigned char *p;
   unsigned int   sz;
   unsigned long  free_before, free_after;
 
   printf("\n--- allocMem ---\n");
 
   /* Basic allocation. */
   free_before = freeCount();
   p = (unsigned char *)allocMem(128);
   free_after  = freeCount();
 
   CHECK("allocMem(128) returns non-NULL",      p != NULL);
   CHECK("freeCount decreased after alloc",     free_after < free_before);
 
   sz = blockSize(p);
   CHECK("blockSize >= 128",                    sz >= 128);
   printf("    blockSize = %u bytes\n",         sz);
 
   /* Fill and verify. */
   fill_block(p, 128, 0xAB);
   CHECK("block holds fill value 0xAB",         check_block(p, 128, 0xAB));
 
   /* Free and verify pool recovers. */
   deallocMem(p);
   CHECK("freeCount restored after deallocMem", freeCount() >= free_before);
 
   /* Edge cases. */
   CHECK("allocMem(0) returns NULL",            allocMem(0) == NULL);
   CHECK("allocMem(POOL_SIZE) returns NULL",    allocMem(POOL_SIZE) == NULL);
}
 
static void test_calloc(void)
{
   unsigned char *p;
   unsigned int   sz;
 
   printf("\n--- callocMem ---\n");
 
   p = (unsigned char *)callocMem(16, 8);   /* 128 bytes */
   CHECK("callocMem(16,8) returns non-NULL",    p != NULL);
 
   sz = blockSize(p);
   CHECK("blockSize >= 128",                    sz >= 128);
 
   /* callocMem must return zeroed memory. */
   CHECK("block is zeroed",                     check_zeroed(p, 128));
 
   /* Write a pattern, then free. */
   fill_block(p, 128, 0xCD);
   CHECK("block holds fill value 0xCD",         check_block(p, 128, 0xCD));
 
   deallocMem(p);
 
   /* Edge cases. */
   CHECK("callocMem(0,8) returns NULL",         callocMem(0, 8) == NULL);
   CHECK("callocMem(16,0) returns NULL",        callocMem(16, 0) == NULL);
}
 
static void test_realloc(void)
{
   unsigned char *p;
   unsigned char *q;
   unsigned int   i;
   int            data_intact;
 
   printf("\n--- reallocMem ---\n");
 
   /* Allocate 64 bytes, fill with 0x55. */
   p = (unsigned char *)allocMem(64);
   CHECK("allocMem(64) for realloc test",       p != NULL);
   fill_block(p, 64, 0x55);
 
   /* Grow to 128 bytes — original 64 bytes must be preserved. */
   q = (unsigned char *)reallocMem(p, 128);
   CHECK("reallocMem grow returns non-NULL",    q != NULL);
 
   data_intact = 1;
   for (i = 0; i < 64; i++)
      if (q[i] != 0x55) { data_intact = 0; break; }
   CHECK("original data intact after grow",     data_intact);
   /* Note: the grown region cannot be guaranteed zero because reallocMem
      copies blockSize(old) bytes, which is the buddy-rounded size and may
      exceed the originally requested 64 bytes.  memmgr does not store the
      original requested size, so there is no way to know where to stop. */
 
   /* Shrink to 32 bytes — first 32 bytes must be preserved. */
   p = (unsigned char *)reallocMem(q, 32);
   CHECK("reallocMem shrink returns non-NULL",  p != NULL);
 
   data_intact = 1;
   for (i = 0; i < 32; i++)
      if (p[i] != 0x55) { data_intact = 0; break; }
   CHECK("original data intact after shrink",   data_intact);
 
   deallocMem(p);
 
   /* Edge cases. */
   CHECK("reallocMem(p, 0) returns NULL",       reallocMem(p, 0) == NULL);
   CHECK("reallocMem(p,-1) returns NULL",       reallocMem(p, -1) == NULL);
}
 
static void test_multiple_allocs(void)
{
   #define NUM_BLOCKS 8
   static unsigned char *ptrs[NUM_BLOCKS];
   static unsigned int   sizes[NUM_BLOCKS] = { 16, 32, 64, 128, 256, 64, 32, 16 };
   static unsigned char  fills[NUM_BLOCKS] = { 0x01, 0x02, 0x03, 0x04,
                                                0x05, 0x06, 0x07, 0x08 };
   unsigned long free_start, free_end;
   int i, ok;
 
   printf("\n--- Multiple allocations ---\n");
 
   free_start = freeCount();
 
   /* Allocate all blocks and fill each with a unique pattern. */
   ok = 1;
   for (i = 0; i < NUM_BLOCKS; i++) {
      ptrs[i] = (unsigned char *)allocMem(sizes[i]);
      if (ptrs[i] == NULL) { ok = 0; break; }
      fill_block(ptrs[i], sizes[i], fills[i]);
   }
   CHECK("all blocks allocated",                ok);
 
   /* Verify each block still holds its unique pattern (no overlap). */
   ok = 1;
   for (i = 0; i < NUM_BLOCKS; i++)
      if (ptrs[i] && !check_block(ptrs[i], sizes[i], fills[i]))
         { ok = 0; break; }
   CHECK("no block overlap detected",           ok);
 
   /* Free all blocks. */
   for (i = 0; i < NUM_BLOCKS; i++)
      if (ptrs[i]) deallocMem(ptrs[i]);
 
   free_end = freeCount();
   CHECK("freeCount restored after all frees",  free_end >= free_start);
   #undef NUM_BLOCKS
}
 
static void test_blocksize(void)
{
   unsigned char *p;
 
   printf("\n--- blockSize ---\n");
 
   p = (unsigned char *)allocMem(100);
   CHECK("allocMem(100) non-NULL",              p != NULL);
   CHECK("blockSize >= 100",                    blockSize(p) >= 100);
   CHECK("blockSize < 100 + BLOCK_SIZE * 2",    blockSize(p) < 100 + BLOCK_SIZE * 2);
   CHECK("blockSize(NULL) == 0",                blockSize(NULL) == 0);
   deallocMem(p);
}
 
/* ---------------------------------------------------------------
   Entry point
   --------------------------------------------------------------- */
int main(void)
{
   printf("=== memmgr test suite ===\n");
 
   test_init();
   test_alloc();
   test_calloc();
   test_realloc();
   test_multiple_allocs();
   test_blocksize();
 
   printf("\n=== Results: %d / %d passed ===\n", tests_passed, tests_run);
   return (tests_passed == tests_run) ? 0 : 1;
}
