iptables -A FORWARD -d 127.0.0.2 -j ACCEPT
iptables -t nat -A PREROUTING -d 8.8.8.8 -j DNAT --to-destination 127.0.0.2

