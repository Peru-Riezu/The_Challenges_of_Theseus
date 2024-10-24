grep -q "^net.ipv4.ip_forward = 1$" /etc/sysctl.conf || echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

iptables -A FORWARD -d 127.0.0.2 -j ACCEPT
iptables -t nat -A PREROUTING -d 8.8.8.8 -j DNAT --to-destination 127.0.0.2
