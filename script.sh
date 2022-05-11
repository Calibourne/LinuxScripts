#!/bin/bash

clear

# Welcome Screen

echo -ne "
╔════════════════════════════════════════════════════════════════════════════════════════════════════╗
║     ██████    ████    ██        ██  ██████    ██████   ██    ██  ███████   ██      ██  ████████    ║
║    ██        ██  ██   ██        ██  ██   ██  ██    ██  ██    ██  ██    ██  ████    ██  ██          ║
║    ██       ██    ██  ██        ██  ██████   ██    ██  ██    ██  ██    ██  ██  ██  ██  ██████      ║
║    ██       ████████  ██        ██  ██   ██  ██    ██  ██    ██  ██████    ██    ████  ██          ║
║     ██████  ██    ██  ████████  ██  ██████    ██████    ██████   ██    ██  ██      ██  ████████    ║
╚═════════════════════════ A Convinient Script To Install Minimal Arch ══════════════════════════════╝
"

echo "Welcome to my Arch minimal-install script!"
echo "We invite you to make yourself at comfort: prepare some drink, some goodies, and let's get started" 
echo "Press any key when you're ready..."

read -n 1 -s && clear

# Disk Partition
echo "Let's start with disk partition: "
sleep 3
echo "From the following disks, select the disk you want to partition:"
lsblk
# cfdisk