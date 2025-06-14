#!/bin/bash

MOUNTPOINT="./media"
NAS_IP="10.0.0.100"
STARTSCRIPT="./start.sh"
LOGFILE="./logs/watchdog.log"

TIMESTAMP="[$(date '+%Y-%m-%d %H:%M:%S')]"
echo "$TIMESTAMP Watchdog gestartet." >> "$LOGFILE"

# NAS erreichbar?
ping -c1 -W1 $NAS_IP > /dev/null
if [ $? -ne 0 ]; then
    echo "$TIMESTAMP NAS nicht erreichbar – überspringe." >> "$LOGFILE"
    exit 0
fi

# Mount vorhanden?
if mount | grep -q "$MOUNTPOINT"; then
    echo "$TIMESTAMP Mount vorhanden." >> "$LOGFILE"
else
    echo "$TIMESTAMP Mount fehlt – Stack wird neu gestartet." >> "$LOGFILE"
    docker compose down >> "$LOGFILE" 2>&1
    nohup "$STARTSCRIPT" >> "$LOGFILE" 2>&1 &
fi