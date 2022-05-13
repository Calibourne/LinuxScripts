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

timedatectl set-ntp true

# Disk Partition
echo "Let's start with disk partition: "
sleep 1

echo "From the following disks, select the disk you want to partition: "
lsblk -p -o NAME,SIZE
echo "Enter the desired device name after the '/dev/' prefix:"

while : ; do
     read disk
     echo "Your choice is /dev/$disk. correct? (y/n)"
     read ans
    [[ "$ans" == "y" ]] && break
    [[ "$ans" == "n" ]] && clear && lsblk -p -o NAME,SIZE && echo "Please enter the desired device name:" && continue
done

clear
while : ; do
     echo "How much space should be allocated for the EFI partition?"
     read efi
     echo "Allocating $efi for the EFI partition. correct? (y/n)"
     read ans
     [[ "$ans" == "y" ]] && break
     [["$ans" != "n"]] && clear && continue
done

clear
while : ; do
     echo "How much space should be allocated for the SWAP partition?"
     read swap
     echo "Allocating $swap for the SWAP section. correct? (y/n)"
     read ans
     [[ "$ans" == "y" ]] && break
     [["$ans" != "n"]] && clear && continue
done

echo "Formatting $disk..."
(
     # create gpt partition table
     echo "g"

     # create EFI partition
     echo "n" ; echo 1
     echo ; echo "+$efi"
     
     # create SWAP partition
     echo "n" ; echo 2
     echo ; echo "+$swap"

     # create Linux System partition
     echo "n" ; echo 3
     echo ; echo

     # fix the partition types
     echo "t" ; echo 1 ; echo 1
     echo "t" ; echo 2 ; echo 19

     # save the progress
     echo "w"
) | fdisk "/dev/$disk"