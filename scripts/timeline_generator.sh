#!/usr/bin/env bash
echo "[+] Generating Case Timeline..."
TIMELINE="Cybercrime_Case/08_Timeline/case_timeline.txt"
echo "=== CYBERCRIME CASE TIMELINE ===" > "$TIMELINE"
echo "Generated on: $(date)" >> "$TIMELINE"
echo "--------------------------------" >> "$TIMELINE"

if [ -f "Cybercrime_Case/00_Case_Index/manifest.csv" ]; then
    echo -e "\n[Evidence Import Timeline]" >> "$TIMELINE"
    tail -n +2 Cybercrime_Case/00_Case_Index/manifest.csv | awk -F',' '{print $1 " - " $2 " - " $3}' >> "$TIMELINE"
fi

echo -e "\n[Device Forensic Snapshots]" >> "$TIMELINE"
ls -ld Cybercrime_Case/07_Device_Forensics/snapshot_* 2>/dev/null | awk '{print $6 " " $7 " " $8 " - " $9}' >> "$TIMELINE"
echo "[✓] Timeline written to $TIMELINE."
