declare -A users

users["labirintoaren_erdigunea"]="piraten_bizitza_oberena_da"
users["irakurri"]="beti"

for username in "${!users[@]}"; do
	password="${users[$username]}"
	useradd -m "$username"
	echo "$username:$password" | chpasswd
	chsh -s /bin/bash "$username"
done
