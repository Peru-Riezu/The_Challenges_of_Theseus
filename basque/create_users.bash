declare -A users

users["labirintoaren_erdigunea"]="piraten_bizitza_hoberena_da"
users["irakurri"]="beti"
users["eskuliburu"]="osoa"
users["madarikatua"]="gogoko_ditut_eskuliburuak"
users["git"]="gud"

groupadd labirinto_gela

for username in "${!users[@]}"; do
	password="${users[$username]}"
	useradd -m "$username"
	usermod -aG labirinto_gela "$username"
	sudo -u "$username" bash -c 'shopt -s extglob'
	echo "$username:$password" | chpasswd
#	echo "$username:root" | chpasswd # for debugging
	chsh -s /bin/bash "$username"
done
