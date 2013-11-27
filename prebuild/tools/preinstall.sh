#!/system/bin/busybox sh

BUSYBOX="/system/bin/busybox"

mkdir /bootloader
mount -t vfat /dev/block/nanda  /bootloader

if [ ! -e /data/system.notfirstrun ]; then	
    echo "do preinstall job"	
  
	/system/bin/sh /system/bin/pm preinstall /system/preinstall
	/system/bin/sh /system/bin/pm preinstall /sdcard/preinstall


	$BUSYBOX touch /data/system.notfirstrun	
	
	 mkdir /databk
   mount -t ext4 /dev/block/nandi /databk	
   rm /databk/data_backup.tar
   umount /databk
   rmdir /databk
   echo "preinstall ok"

elif [ -e /bootloader/data.need.backup ];then
   echo "data backup:tar /databk/data_backup.tar /data"
   mkdir /databk
   mount -t ext4 /dev/block/nandi /databk	
   
   rm /databk/data_backup.tar

   $BUSYBOX tar -cf /databk/data_backup.tar /data
   rm /bootloader/data.need.backup
  
   umount /databk
   rmdir /databk

else 
   echo "do nothing"
fi
umount /bootloader
rmdir /bootloader




