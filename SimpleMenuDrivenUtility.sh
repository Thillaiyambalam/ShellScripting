#!/bin/bash
while true; do
 echo "1. Show Date"
echo "2. List Files"
echo "3. Disk Usage"
echo "4. Exit"
read -p "Choose option: " opt
case $opt in
 1) date ;;
2) ls -l ;;
3) df -h ;;
4) exit ;;
*) echo "Invalid Option" ;;
 esac
done
