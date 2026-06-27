#!/usr/bin/env bash
echo "[+] Initializing Evidence Collector..."
MANIFEST="Cybercrime_Case/00_Case_Index/manifest.csv"
[ ! -f "$MANIFEST" ] && echo "Timestamp,Category,Filename,SHA256" > "$MANIFEST"

read -p "Enter path to file/folder to import: " SRC_PATH
read -p "Enter category (e.g., Evidence, Financial, Reference): " CAT

if [ -f "$SRC_PATH" ]; then
    FNAME=$(basename "$SRC_PATH")
    HASH=$(sha256sum "$SRC_PATH" | awk '{print $1}')
    TARGET="Cybercrime_Case/02_Evidence/$FNAME"
    cp "$SRC_PATH" "$TARGET"
    echo "$(date +%Y%m%d_%H%M%S),$CAT,$FNAME,$HASH" >> "$MANIFEST"
    echo "[✓] File $FNAME imported and hashed successfully."
else
    echo "[-] Source path not found!"
fi
