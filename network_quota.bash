#!/bin/bash

THRESHOLD=$((100 * 1024 * 1024 * 1024))  # 100 GB in bytes
INTERFACE=$(ip -o link show | awk -F': ' '$2 !~ /^(lo|docker)/ {print $2}')

TRAFFIC_FILE="/root/traffic_data.txt"
CURRENT_MONTH=$(date +%m)

if [ ! -f "$TRAFFIC_FILE" ]; then
    echo "0 $CURRENT_MONTH" > $TRAFFIC_FILE
fi

read LAST_TRAFFIC LAST_MONTH < $TRAFFIC_FILE

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

if [ "$LAST_MONTH" != "$CURRENT_MONTH" ]; then
    LAST_TRAFFIC=0
    echo "0 $CURRENT_MONTH" > $TRAFFIC_FILE
fi

USED_TRAFFIC=$((TOTAL_OUTBOUND - LAST_TRAFFIC))

if [ "$USED_TRAFFIC" -ge "$THRESHOLD" ]; then
    sudo ifconfig $INTERFACE down  # Disable the network interface
fi

echo "$TOTAL_OUTBOUND $CURRENT_MONTH" > $TRAFFIC_FILE

