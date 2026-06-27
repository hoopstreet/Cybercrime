#!/usr/bin/env bash
echo "[+] Running Cryptographic Integrity Check..."
MANIFEST="Cybercrime_Case/00_Case_Index/manifest.csv"
REPORT="Cybercrime_Case/10_Integrity/verification_report_$(date +%Y%m%d_%H%M%S).txt"

echo "=== INTEGRITY VERIFICATION REPORT ===" > "$REPORT"
echo "Checked on: $(date)" >> "$REPORT"
echo "-------------------------------------" >> "$REPORT"

if [ ! -f "$MANIFEST" ]; then
    echo "[-] No manifest index found to verify."
    exit 1
fi

FAIL_COUNT=0
while IFS=, read -r TS CAT FNAME HASH; do
    if [ "$TS" != "Timestamp" ]; then
        FILE_PATH="Cybercrime_Case/02_Evidence/$FNAME"
        if [ -f "$FILE_PATH" ]; then
            CURRENT_HASH=$(sha256sum "$FILE_PATH" | awk '{print $1}')
            if [ "$CURRENT_HASH" == "$HASH" ]; then
                echo "[MATCH] $FNAME" >> "$REPORT"
            else
                echo "[MODIFIED/CORRUPTED] $FNAME" >> "$REPORT"
                ((FAIL_COUNT++))
            fi
        else
            echo "[MISSING] $FNAME" >> "$REPORT"
            ((FAIL_COUNT++))
        fi
    fi
done < "$MANIFEST"

echo "Verification done. Failures detected: $FAIL_COUNT. Full report saved to $REPORT."
