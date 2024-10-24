grep -q "^net.ipv4.ip_forward = 1$" /etc/sysctl.conf || echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

iptables -C FORWARD -d 127.0.0.2 -j ACCEPT 2>/dev/null || iptables -A FORWARD -d 127.0.0.2 -j ACCEPT
iptables -t nat -C PREROUTING -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2 2>/dev/null || \
iptables -t nat -A PREROUTING -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2
iptables -t nat -C OUTPUT -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2 2>/dev/null || \
iptables -t nat -A OUTPUT -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2
iptables -t nat -C PREROUTING -s 172.17.0.0/16 -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2 2>/dev/null || \
iptables -t nat -A PREROUTING -s 172.17.0.0/16 -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2
iptables -t nat -C DOCKER-USER -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2>/dev/null || \
iptables -t nat -A DOCKER-USER -d 9.0.0.1 -j DNAT --to-destination 127.0.0.2

