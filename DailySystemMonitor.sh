#!/bin/bash
logfile="/var/log/system_health.log"
echo "---------- $(date) ----------" >> $logfile
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
ram_usage=$(free | awk '/Mem:/ { printf("%.2f"), $3/$2 * 100.0 }')
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "CPU Usage: $cpu_usage%" >> $logfile
echo "RAM Usage: $ram_usage%" >> $logfile
echo "Disk Usage: $disk_usage%" >> $logfile
if (( $(echo "$cpu_usage > 80.0" | bc -l) )); then
 echo "⚠ ALERT: High CPU usage!" >> $logfile
fi
if (( $(echo "$ram_usage > 80.0" | bc -l) )); then
 echo "⚠ ALERT: High RAM usage!" >> $logfile
fi
if [ $disk_usage -gt 80 ]; then
 echo "⚠ ALERT: High Disk usage!" >> $logfile
fi
echo "" >> $logfile
