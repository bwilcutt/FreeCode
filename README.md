This set of repositories contains finished and ongoing hobby projects I am working on.


Mathrix         - GUI interface for calc. Does graphing. Almost complete.

calc            - Command-line algebraic parser. Started this as an interview "at home" project for Microchip. 
                 I didn't get the job, but I got the parsing itch! It is mostly complete and runs independently of Mathrix, 
                 which sits on top of it. If you download Mathrix, you'll need calc but not vice-versa.

canfs           - This is a J1939 CAN bus file system. Very unique. It maps data points to the file system (you can now cat 
                  your data points to your screen), allows data point management, and extends to NETFS for security. Basically, 
                  this is MQTT-like (before MQTT existed), but it far exceeds MQTT (imho).

encx24j600      - This is the Linux ethernet driver for anyone using ENCX24j600-based hardware. It has been fully tested and 
                  published under GPL in 2008.

gitout          - A bash shell script I find myself needing more often than not. It removes old artifacts from GitLab. It's 
                  GUI-driven and easy to use.

mcp3202         - This is for the Microchip MCP3202. It runs on the AM335x processor, which has two PRU cores. This runs in
                  one core and pulls data from a connected SPI MCP3202 chip (analog-to-digital converter). It pulls data from 
                  the 3202 and treats it as temperature information. The information is fed to the main processor through shared 
                  memory to the uio_mcp3202 project. You'll need that. This code was written in Texas Instruments' IDE for the 
                  AM335x processor.

uio_mcp3202     - This is the 2nd UIO driver ever published for Linux. It runs on Linux, pulling data from the mcp3202. Your app 
                  then can access this data through this driver.

memmgr          - Written in the late 80s, this driver is based on the D. Knuth "Buddy System" from 
                  "The Art of Computer Programming Vol II." It runs in small, embedded systems that need memory management. It has 
                  been adopted by a number of organizations throughout the years. Stable. Consistent. VERY easy to use.


More to come as I convert stuff.

Bryan - 2026
bwilcutt@yahoo.com
