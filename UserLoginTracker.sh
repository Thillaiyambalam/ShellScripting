#!/bin/bash
log_date=$(date +%F)
log_file="/var/log/user-login-$log_date.log"
last | grep "$(date +'%b %_d')" > $log_file
#You can run this every evening via cron.
