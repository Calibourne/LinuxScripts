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
echo "From the following disks, select the disk you want to partition: (enter the whole path presented)"
sleep 3
lsblk -p -o NAME > disks

while : ; do
     select opt in disks; do
          echo "Selected disk: $opt, is that correct? (y/n)"
     done
     read ans
     [[ "$ans" != "y" ]] || break
done

# while : ; do
#      read disk
#      echo "Your choice is $disk, is that correct? (y/n)"
#      read ans
#     [[ "$ans" != "y" ]] || break
# done

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
) | fdisk $disk