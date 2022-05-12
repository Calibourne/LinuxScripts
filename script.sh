#!/bin/bash

clear

# Welcome Screen

echo -ne "
╔══════════════════════════════════════════════════════════════════════════════════════════════════╗
║    ██████    ████    ██        ██  ██████    ██████   ██    ██  ███████   ██      ██  ████████   ║
║   ██        ██  ██   ██        ██  ██   ██  ██    ██  ██    ██  ██    ██  ████    ██  ██         ║
║   ██       ██    ██  ██        ██  ██████   ██    ██  ██    ██  ██    ██  ██  ██  ██  ██████     ║
║   ██       ████████  ██        ██  ██   ██  ██    ██  ██    ██  ██████    ██    ████  ██         ║
║    ██████  ██    ██  ████████  ██  ██████    ██████    ██████   ██    ██  ██      ██  ████████   ║
╚════════════════════════ A Convinient Script To Install Minimal Arch ═════════════════════════════╝
"

echo "Welcome to my Arch minimal-install script!"
echo "We invite you to make yourself at comfort: prepare some drink, some goodies, and let's get started" 
echo "Press any key when you're ready..."

read -n 1 -s && clear

# Disk Partition
echo "Let's start with disk partition: "
sleep 1
echo "From the following disks, select the disk you want to partition: (enter the device name after the '/dev/' prefix)"
sleep 3
disks=$(blkid | awk '{print substr($1, 0, length($1) - 1)}')
disks="${disks[@]/NAME}"

echo "$disks"

while : ; do
     read disk
     echo "Your choice is /dev/$disk, is that correct? (y/n)"
     read ans
    [[ "$ans" != "y" ]] || break
done

echo "How much space should be allocated for the EFI partition?"
while : ; do
     read efi
     echo "Allocating $efi for the EFI section. correct? (y/n)"
     read ans
     [[ "$ans" != "y" ]] || break
done

# fdisk $disk(
# echo "g"
# echo "n"
# echo "+$boot"

# )
(
echo "g" # create gpt partition table
echo "n" # create new partition
echo 1 # first partition
echo 
echo "+$efi"
) | fdisk "/dev/$disk"