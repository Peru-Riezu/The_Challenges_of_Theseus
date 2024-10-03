declare -A users=
(
	["labirintoaren_erdigunea"]="piraten_bizitza_oberena_da"
	["irakurri"]="beti"
)

for username in "${!users[@]}"; do
	password="${users[$username]}"
	useradd -m "$username"
	echo "$username:$password" | chpasswd
	chsh -s /bin/bash "$username"
done

#useradd -m labirintoaren_erdigunea
#echo 'labirintoaren_erdigunea:piraten_bizitza_oberena_da' | chpasswd
#chsh -s /bin/bash labirintoaren_erdigunea
#
#useradd -m irakurri
#echo 'irakurri:beti' | chpasswd
#chsh -s /bin/bash labirintoaren_erdigunea
