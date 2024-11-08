INTERFACE=$(ip -o link show | awk -F': ' '$2 !~ /^(lo|docker)/ {print $2}')
systemctl stop vnstat
rm /var/lib/vnstat/vnstat.db
systemctl start vnstat
ifconfig $INTERFACE up
