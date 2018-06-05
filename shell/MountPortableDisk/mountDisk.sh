#########################################################################
# File Name: mountDisk.sh
# Author: Kent Lee
# mail: kent1411390610@gmail.com
# Created Time: Tue Jun  5 14:36:55 2018
#########################################################################
#!/bin/bash
#查找当前系统挂载的移动硬盘，文件系统格式为ntfs
echo "--------current disk---------"
tmpFile=~/tmptmptmp
(mount | grep ntfs )> $tmpFile
#disk=`echo "$tmpFile"|awk ' ' '{print $1}'`
disk=`cut -d " " -f1 "$tmpFile"`
echo $disk
rm $tmpFile
echo "Are you sure to remount it  with rw  rather than read only rights? y/N"
DirToMount=~/mnt_ntfs
read choice

if [ "$choice" = "y" ];
then
	sudo umount  "$disk"
	if [ ! -d "$DirToMount" ];
	then
		mkdir "$DirToMount"
	fi
	sudo mount_ntfs -o rw,nobrowse "$disk" "$DirToMount"
else
	echo "quiting..."
	exit 1
fi
	



