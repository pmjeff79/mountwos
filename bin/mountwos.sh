#!/bin/bash

# Begin of /home/jeff/Desktop/wos/mountwos.sh

# Mounts the WOS Virtual file sys for chroot system maintenece.

# Environment settings
export LFS="/mnt/lfs"
export FSTYPE="ext3"
export LFSHDD="/dev/sda3"
export LFSSWAP="/dev/sda4"


echo "You are nw the ROOT USER ON YOUR HOST SYSTEM!!!"
echo "Mounting HD localation specified in the settings"


echo $FSTYPE
echo $LFSHDD
echo $LFSSWAP

mount -v -t $FSTYPE $LFSHDD $LFS
mount -v --bind /dev $LFS/dev
mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

echo "Virtual WOS is mounted to your host"
echo "Your swap is being turned on"
swapon /dev/sda4

## [.]; wait 4;;
## [..]; wait 3;;
## [...]; wait 2;;
## [....]; wait 1;;
## [.....]; break;;


echo "swap located at $LFSSWAP in your settings are now active!"


echo "Now run the chwoot cmd to be chrooted into WHOMPOS"

while true; do
    read -p "Do you wish to AutoMagically run the WhompOS chwoot program now?" yn
    case $yn in
        [Yy]* ) /usr/sbin/chwoot; break;;
        [Nn]* ) echo "Goodbye Thanks anyway. Coffee break is over"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# End  /home/jeff/Desktop/wos/mountwos.sh
