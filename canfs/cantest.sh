
echo "Can Test Script"
echo
echo

######### CREATE DEVICES ##########
          
echo "Creating Onyxx Objects"
for i in `seq 0 9`;
do
        cansend vcan0 000#0011220${i}
done

######### VERIFY DEVICES ##########

echo "Verifying Object Creation"
echo
for i in `seq 0 9`;
do
        if [ -f /mnt/ocanfs/onyxx_11220${i} ]
        then
                echo "/mnt/ocanfs/onyxx_11220${i} not found."
                exit $?
        fi
done

######### CANBUS WRITE TO A0/value ##########

echo -n "A0 SET ONE Test... "
for i in `seq 3 5`;
do
	devid=$((i - 3))
	for x in `seq 0 7`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		cansend vcan0 00${hexdevid}#5${hexchannel}1234
	done
done

######### VERIFY A0/value ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 7`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq 4660 /mnt/ocanfs/onyxx_11220$[ i-3 ]/a0/a.${x}/value ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/a0/a.${x}/value
		fi
	done
done

######### CANBUS WRITE TO D0/value ##########

echo
echo -n "D0 SET ONE Test... "
for i in `seq 3 5`;
do
	for x in `seq 0 9`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		cansend vcan0 00${hexdevid}#1${hexchannel}01
	done
done

######### VERIFY D0/value ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 9`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq 1 /mnt/ocanfs/onyxx_11220$[ i-3 ]/d0/d.${x}/value ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/d0/d.${x}/value
		fi
	done
done

######### CANBUS WRITE TO UI/value ##########

echo
echo -n "UI SET ONE Test... "
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		cansend vcan0 00${hexdevid}#9${hexchannel}1234
	done
done

######### VERIFY UI/value ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq 4660 /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/value ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/value
		fi
	done
done

######### CANBUS WRITE TO UI/mode ##########

echo
echo -n "UI SET ONE Mode Test... "
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		cansend vcan0 00${hexdevid}#d${hexchannel}01
	done
done

######### VERIFY UI/mode ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq resistance /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/mode ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/mode
		fi
	done
done

echo 
echo File System Read/Write Test

######### FILESYS WRITE TO A0/value ##########

echo -n "A0 FS Test... "
for i in `seq 3 5`;
do
	devid=$((i - 3))
	for x in `seq 0 7`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		echo 4411 > /mnt/ocanfs/onyxx_11220$[ i-3 ]/a0/a.${x}/value
	done
done

######### VERIFY A0/value ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 7`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq 4411 /mnt/ocanfs/onyxx_11220$[ i-3 ]/a0/a.${x}/value ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/a0/a.${x}/value
		fi
	done
done

######### FILESYS WRITE TO D0/value ##########

echo
echo -n "D0 FS Test... "
for i in `seq 3 5`;
do
	for x in `seq 0 9`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		echo 0 > /mnt/ocanfs/onyxx_11220$[ i-3 ]/d0/d.${x}/value
	done
done

######### VERIFY D0/value ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 9`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq 0 /mnt/ocanfs/onyxx_11220$[ i-3 ]/d0/d.${x}/value ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/d0/d.${x}/value
		fi
	done
done

######### FILESYS WRITE TO UI/value ##########

echo
echo -n "UI FS Test... "
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		echo 911 > /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/value
	done
done

######### VERIFY UI/value ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq 911 /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/value ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/value
		fi
	done
done

######### FILESYS WRITE TO UI/mode ##########

echo
echo -n "UI FS Mode Test... "
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		echo voltage > /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/mode
	done
done

######### VERIFY UI/mode ##########

echo -n "verifying..."
for i in `seq 3 5`;
do
	for x in `seq 0 15`;
	do
		hexchannel=`echo "ibase=10;obase=16;$x"|bc`
		hexdevid=`echo "ibase=10;obase=16;${i}"|bc`
		if ! grep -xq voltage /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/mode ; then
			echo Point failed write verification: /mnt/ocanfs/onyxx_11220$[ i-3 ]/ui/u.${x}/mode
		fi
	done
done

echo
echo Onyxx CAN BUS Driver test completed.

