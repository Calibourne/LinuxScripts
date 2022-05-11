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
lsblk -p -l

while : ; do
     read disk
     echo "Your choice is $disk, is that correct? (y/n)"
     read ans
    [[ "$ans" != "y" ]] || break
done

echo "How much space should be allocated for the boot sector?"
while : ; do
     read boot
     echo "Allocating $boot for the boot section. correct? (y/n)"
     read ans
     [[ "$ans" != "y" ]] || break
done

fdisk $disk
g
1
+"$boot"