INTERFACE=$(ip -o link show | awk -F': ' '$2 !~ /^(lo|docker)/ {print $2}')
/usr/sbin/sysctl stop vnstat
rm /var/lib/vnstat/vnstat.db
/usr/sbin/sysctl start vnstat
ifconfig $INTERFACE up
