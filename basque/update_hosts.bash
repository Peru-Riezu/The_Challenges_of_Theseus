CURRENT_HOSTNAME=$(uname -n)
if ! getent -s files hosts "$CURRENT_HOSTNAME" > /dev/null; then
	printf '\n127.0.1.1\t%s\n' "$CURRENT_HOSTNAME" >> /etc/hosts
fi

echo "" >> /etc/hosts
echo "9.0.0.1 atenaseko-portua.net" >> /etc/hosts

