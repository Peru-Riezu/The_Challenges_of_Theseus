#!/bin/bash
#
/usr/sbin/sysctl restart vnstat

THRESHOLD=$((95 * 1024 * 1024 * 1024))  # 100 GB in bytes
INTERFACE=$(ip -o link show | awk -F': ' '$2 !~ /^(lo|docker)/ {print $2}')

TOTAL_TX_FIELD=$(vnstat --oneline -i $INTERFACE | awk -F ';' '{print $10}')

if [[ $TOTAL_TX_FIELD == *"GiB"* ]]; then
    TOTAL_OUTBOUND=$(echo $TOTAL_TX_FIELD | sed 's/ GiB//' | awk '{printf "%.0f", $1 * 1024 * 1024 * 1024}')
elif [[ $TOTAL_TX_FIELD == *"MiB"* ]]; then
    TOTAL_OUTBOUND=$(echo $TOTAL_TX_FIELD | sed 's/ MiB//' | awk '{printf "%.0f", $1 * 1024 * 1024}')
elif [[ $TOTAL_TX_FIELD == *"KiB"* ]]; then
    TOTAL_OUTBOUND=$(echo $TOTAL_TX_FIELD | sed 's/ KiB//' | awk '{printf "%.0f", $1 * 1024}')
else
    TOTAL_OUTBOUND=$(echo $TOTAL_TX_FIELD | sed 's/ B//' | awk '{print $1}')
fi

if [ "$TOTAL_OUTBOUND" -ge "$THRESHOLD" ]; then
    ifconfig $INTERFACE down
fi
