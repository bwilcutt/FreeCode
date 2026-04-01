This is the MCP3202 Analog-to-Digital Convertor PRU code.  The PRU (programmable realtime unit) is found on the AM335X processor used in the Lynxspring LSM's.  The purpose of this code is to run independent of the process while sampling 10's of thousands of samples a second.  Samples are collected and returned to the MCP3202 UIO driver where they may be read (see MCP3202 UIO driver repository).

To build:

1. Fetch the repository
2. Open the resulting project using Texas Instrument's CodeCompilser Sudio 6.1.2
3. Compile
4. Move resulting output file into the Onyxx device's /lib/firmware directory using the name "am335x-pru0-fw" or "am335x-pru1-fw"
5. Linux must be built to support loading the PRU automatically-- this is NOT the default configuration of the OS.  To assure it is set to load the PRUs, make sure in the "make menuconfig" menu, the following options are set:

(note: menu paths change all the time, good luck!)

Device Drivers->User Space I/O Drivers->
<M> Texas Instruments PRUSS driver

Device Drivers->Remoteproc drivers->
<M> OMAP remoteproc support
<M> TI PRUSS remoteproc support

**Running**

Once the driver and corresponding UIO driver are running, there should be a /sys/class/uio/uio0 directory were the ADC data appears.


Bryan Wilcutt
4.4.2017