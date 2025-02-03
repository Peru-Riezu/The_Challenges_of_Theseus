declare -A users

users["labirintoaren_erdigunea"]="piraten_bizitza_hoberena_da"
users["irakurri"]="beti"
users["eskuliburu"]="osoa"
users["madarikatua"]="gogoko_ditut_eskuliburuak"
users["git"]="gud"
users["eragile_analitikoa"]="Charles_Babbage"
users["Z3"]="Konrad_Zuse"
users["Bombe"]="Bombe_gailua_ez_zen_turing_osoa"
users["Sir_Tim_Berners-Lee"]="www"
users["IBM_704"]="GM-NAA_I/O"
users["Gaiu_Itsasaldi-Aurresatzailea"]="Lord_Kelvin"
users["Harrisonen_kronometroa"]="segundo_bat_gauerdirako"
users["Antiziterako_mekanismoa"]="Machaneus"
users["abakoa"]="hautsetatik_hautsetara"

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

useradd -M -N -r -g funtsesko_taldea -s /usr/sbin/nologin Fedra
groupadd Aphroditaren_madarikazioa
groupadd Semeordearen_eriotza
groupadd ahizparen_desagertzea
groupadd heroiaren_emaztea
groupadd erregin_ezkontidea
usermod -aG Aphroditaren_madarikazioa,Semeordearen_eriotza,ahizparen_desagertzea,\
heroiaren_emaztea,erregin_ezkontidea Fedra

