#!/data/data/com.termux/files/usr/bin/bash

ROOT="$HOME/storage/shared/Documents/Cybercrime/Cybercrime_Case/08_Monitor"

mkdir -p "$ROOT"

while true
do

STAMP=$(date +"%Y%m%d_%H%M%S")

DIR="$ROOT/$STAMP"

mkdir -p "$DIR"

date > "$DIR/time.txt"

getprop > "$DIR/getprop.txt" 2>/dev/null

ip addr > "$DIR/ip.txt" 2>/dev/null

ip route > "$DIR/routes.txt" 2>/dev/null

ip neigh > "$DIR/neighbors.txt" 2>/dev/null

ps -A > "$DIR/processes.txt"

netstat -an > "$DIR/netstat.txt" 2>/dev/null

ss -tulpen > "$DIR/sockets.txt" 2>/dev/null

df -h > "$DIR/storage.txt"

logcat -d > "$DIR/logcat.txt" 2>/dev/null

find "$HOME/storage/shared/Documents/Cybercrime/Evidence_Final" \
-type f \
-exec sha256sum "{}" \; \
> "$DIR/SHA256SUMS.txt"

sleep 300

done
