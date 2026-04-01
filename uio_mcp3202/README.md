This repository contains the MCP3202 UIO driver. The driver is meant to run within a Linux environment where it will interface between the MCP3202 PRU Driver (see MCP3202 PRU repository) and the UIO (user I/O) file system of Linux.

The driver has been integrated into the "make menuconfig" system and is located (or should be placed) in the User I/O Driver directory.

When this driver, along with the PRU driver, are properly running, an MCP3202 a/d convertor directory is created under /sys/class/uio/uio0.  The data within this directory extends the sampled data from the MCP3202.

Bryan Wilcutt
4.4.2017