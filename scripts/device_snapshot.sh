#!/usr/bin/env bash
echo "[+] Capturing Device Forensic Snapshot..."
TS=$(date +%Y%m%d_%H%M%S)
SNAP_DIR="Cybercrime_Case/07_Device_Forensics/snapshot_$TS"
mkdir -p "$SNAP_DIR"

getprop > "$SNAP_DIR/device_properties.txt" 2>/dev/null
pm list packages > "$SNAP_DIR/installed_packages.txt" 2>/dev/null
df -h > "$SNAP_DIR/storage_info.txt" 2>/dev/null
ip addr > "$SNAP_DIR/network_config.txt" 2>/dev/null
ps -A > "$SNAP_DIR/running_processes.txt" 2>/dev/null
logcat -d -t 500 > "$SNAP_DIR/logcat_tail.txt" 2>/dev/null

# Hash the generated snapshot files
sha256sum "$SNAP_DIR"/* > "$SNAP_DIR/snapshot_manifest.sha256"
echo "[✓] Device snapshot completed and stored in $SNAP_DIR."
