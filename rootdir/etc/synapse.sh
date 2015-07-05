#!/system/xbin/busybox sh

mount -t rootfs -o remount,rw rootfs

chmod 777 -R /res/synapse

for i in /sys/block/*/queue/add_random;do echo 0 > $i;done

ln -s /res/synapse/uci /sbin/uci

/sbin/uci

mkdir -p /mnt/ntfs
chmod 777 /mnt/ntfs
mount -o mode=0777,gid=1000 -t tmpfs tmpfs /mnt/ntfs

mount -t rootfs -o remount,ro rootfs
