#!/system/xbin/busybox sh

mount -t rootfs -o remount,rw rootfs

chmod 777 -R /res/synapse
ln -s /res/synapse/uci /sbin/uci
/sbin/uci

for i in /sys/block/*/queue/add_random;do echo 0 > $i;done

mkdir -p /mnt/ntfs
chmod 777 /mnt/ntfs
mount -o mode=0777,gid=1000 -t tmpfs tmpfs /mnt/ntfs

mount -w -o remount /system
rm -f /system/bin/auditd
mount -r -o remount /system
