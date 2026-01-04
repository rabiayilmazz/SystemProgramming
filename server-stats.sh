#!/bin/bash

echo "========================================"
echo "        SERVER PERFORMANCE STATS        "
echo "========================================"
echo ""

### OS INFO ###
echo "🖥️  OS & HOST INFO"
echo "----------------------------------------"
hostnamectl 2>/dev/null || uname -a
echo ""

### UPTIME & LOAD ###
echo "⏱️  UPTIME & LOAD AVERAGE"
echo "----------------------------------------"
uptime
echo ""

### CPU USAGE ###
echo "🔥 CPU USAGE"
echo "----------------------------------------"
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1)
CPU_USAGE=$((100 - CPU_IDLE))
echo "Total CPU Usage: ${CPU_USAGE}%"
echo ""

### MEMORY USAGE ###
echo "🧠 MEMORY USAGE"
echo "----------------------------------------"
free -h | awk '
/Mem:/ {
  used=$3; free=$4; total=$2;
  printf "Used: %s / Total: %s\n", used, total
}
'
free | awk '
/Mem:/ {
  used=$3; total=$2;
  printf "Usage: %.2f%%\n", used/total*100
}
'
echo ""

### DISK USAGE ###
echo "💾 DISK USAGE"
echo "----------------------------------------"
df -h --total | awk '
/total/ {
  printf "Used: %s / Total: %s (%s used)\n", $3, $2, $5
}
'
echo ""

### TOP CPU PROCESSES ###
echo "🚀 TOP 5 PROCESSES BY CPU"
echo "----------------------------------------"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""

### TOP MEMORY PROCESSES ###
echo "🐏 TOP 5 PROCESSES BY MEMORY"
echo "----------------------------------------"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo ""

### LOGGED IN USERS ###
echo "👤 LOGGED IN USERS"
echo "----------------------------------------"
who | wc -l
echo ""

### FAILED LOGIN ATTEMPTS (Stretch Goal) ###
echo "🔐 FAILED LOGIN ATTEMPTS (last 10)"
echo "----------------------------------------"
if [ -f /var/log/auth.log ]; then
  grep "Failed password" /var/log/auth.log | tail -n 10
elif [ -f /var/log/secure ]; then
  grep "Failed password" /var/log/secure | tail -n 10
else
  echo "Auth log not found."
fi

echo ""
echo "========================================"
echo "        END OF SERVER REPORT             "
echo "========================================"
