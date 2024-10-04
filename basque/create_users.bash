declare -A users

users["labirintoaren_erdigunea"]="piraten_bizitza_oberena_da"
users["irakurri"]="beti"

groupadd labirinto_gela

for username in "${!users[@]}"; do
	password="${users[$username]}"
	useradd -m "$username"
	usermod -aG labirinto_gela "$username"
	echo "$username:$password" | chpasswd
	chsh -s /bin/bash "$username"
done
