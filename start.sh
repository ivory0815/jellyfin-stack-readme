#!/bin/bash
MOUNTPOINT="./media"
SERVER="<NAS_HOST>:/volume/media"

echo "Prüfe Mountpoint: $MOUNTPOINT"

if ! mount | grep -q "$MOUNTPOINT"; then
    echo "Versuche zu mounten..."
    mkdir -p "$MOUNTPOINT"
    sudo mount_nfs -o resvport,rsize=65536,wsize=65536,async -P "$SERVER" "$MOUNTPOINT"
fi

echo "Starte Docker-Stack..."
docker compose up -d