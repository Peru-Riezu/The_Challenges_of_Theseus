grep -q "^net.ipv4.ip_forward = 1$" /etc/sysctl.conf || echo "net.ipv4.ip_forward = 1" | tee -a /etc/sysctl.conf
sysctl -p

iptables -C FORWARD -d 127.0.0.2 -j ACCEPT 2>/dev/null || iptables -A FORWARD -d 127.0.0.2 -j ACCEPT
iptables -t nat -C OUTPUT -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2 2>/dev/null || \
iptables -t nat -A OUTPUT -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2
