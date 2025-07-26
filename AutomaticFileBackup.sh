#!/bin/bash
src="/home/user/data"
dest="/home/user/backup"
timestamp=$(date +%F-%H-%M-%S)
filename="data-backup-$timestamp.tar.gz"
mkdir -p $dest
tar -czf $dest/$filename $src
echo "Backup completed at $timestamp" >> /home/user/backup/backup.log
