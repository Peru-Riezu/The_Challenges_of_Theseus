declare -A users

users["labirintoaren_erdigunea"]="piraten_bizitza_oberena_da"
users["irakurri"]="beti"

groupadd labyrinth_room
setfacl -m g:labyrinth_room:0 /bin/dash
setfacl -m g:labyrinth_room:0 /bin/sh

for username in "${!users[@]}"; do
	password="${users[$username]}"
	useradd -m "$username"
	usermod -aG labyrinth_room "$username"
	echo "$username:$password" | chpasswd
	chsh -s /bin/bash "$username"
done
