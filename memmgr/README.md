This is DONALD KNUTH'S "Buddy System".  An algorithm used for allocating and deallocating memory.  It is primarily used in embedded systems where there is no
OS or a limited OS. 

Provides:

init()
alloc()
calloc()
realloc()
blocksize()

You can grab memory located anywhere in your system and have this algorithm use it for memory management.  You can create multiple regions as well.

The algorithm was implemented in the mid 90's and has been continuously used in various products and projects-- some of which you use 
(Iridium SatCom system, SatCom Modems, others).  It's safe and well tested (out the whazoo!) but that doesn't mean something won't blow up
on you (I'm hinting that I don't guarantee this).

Included is test_manager.c.  This app was written by Claude AI system (because I'm lazy).  It tests all the functions of the
memory manager and shows you how to use it.

The Buddy System is well documented in Donald's Knuth's "Art of Computer Programming", Vol II.
