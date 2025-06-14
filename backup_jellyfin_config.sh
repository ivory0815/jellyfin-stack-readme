#!/bin/bash
BACKUP_DIR="./backups"
CONFIG_DIR="./config"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="config_backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$FILENAME" -C "$CONFIG_DIR" .
echo "Backup gespeichert: $BACKUP_DIR/$FILENAME"