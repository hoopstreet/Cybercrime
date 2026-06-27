#!/usr/bin/env bash
while true; do
    clear
    echo "==============================================="
    echo "     CYBERCRIME INVESTIGATION WORKSPACE        "
    echo "==============================================="
    echo " 1) Collect & Hash New Evidence"
    echo " 2) Capture Device Forensic Snapshot"
    echo " 3) Compile Chronological Timeline"
    echo " 4) Run Cryptographic Integrity Check"
    echo " 5) Generate Master Case Report"
    echo " 6) Push Updates to GitHub Repository"
    echo " 0) Exit Toolkit"
    echo "==============================================="
    read -p "Select an operation [0-6]: " OPT
    case $OPT in
        1) bash scripts/evidence_collector.sh ;;
        2) bash scripts/device_snapshot.sh ;;
        3) bash scripts/timeline_generator.sh ;;
        4) bash scripts/integrity_checker.sh ;;
        5) bash scripts/report_generator.sh ;;
        6) 
            git add .
            git commit -m "Automated forensic case update: $(date +'%Y-%m-%d %H:%M')"
            echo "[!] Attempting secure git synchronization..."
            git push origin main
            ;;
        0) echo "Exiting workspace."; break ;;
        *) echo "Invalid option!" ;;
    esac
    read -p "Press Enter to return to menu..." temp
done
