declare -A users

#users["labirintoaren_erdigunea"]="piraten_bizitza_hoberena_da"
#users["irakurri"]="beti"
#users["eskuliburu"]="osoa"
#users["madarikatua"]="gogoko_ditut_eskuliburuak"
#users["git"]="gud"
#users["eragile_analitikoa"]="Charles_Babbage"
#users["Z3"]="Konrad_Zuse"
#users["Bombe"]="Bombe_gailua_ez_zen_turing_osoa"
#users["Sir_Tim_Berners-Lee"]="www"
#users["IBM_704"]="GM-NAA_I/O"
#users["Gaiu_Itsasaldi-Aurresatzailea"]="Lord_Kelvin"
#users["Harrisonen_kronometroa"]="segundo_bat_gauerdirako"
#users["Antiziterako_mekanismoa"]="Machaneus"
#users["abakoa"]="hautsetatik_hautsetara"
#users["hastapena"]="ilargiondorioa"

#groupadd labirinto_gela

users["center_of_the_labyrinth"]="a_pirate_s_life_is_best"
users["read"]="always"
users["the"]="whole_freaking"
users["manual"]="I_like_manuals"
users["git"]="gud"
users["analytical_engine"]="Charles_Babbage"
users["Z3"]="Konrad_Zuse"
users["Bombe"]="Bombe_was_not_turing_complete"
users["Sir_Tim_Berners-Lee"]="www"
users["IBM_704"]="GM-NAA_I/O"
users["Tide-predicting_machine"]="Lord_Kelvin"
users["Harrison_s_Chronometer"]="a_second_to_midnight"
users["Antikythera_mechanism"]="Machaneus"
users["abacus"]="from_dust_to_dust"
users["inception"]="lunar_effect"

groupadd labyrinth_room

for username in "${!users[@]}"; do
	password="${users[$username]}"
	useradd -m "$username"
	usermod -aG labyrinth_room "$username"
	sudo -u "$username" bash -c 'shopt -s extglob'
	echo "$username:$password" | chpasswd
#	echo "$username:root" | chpasswd # for debugging
	chsh -s /bin/bash "$username"
done

#groupadd funtsesko_taldea
#useradd -M -N -r -g funtsesko_taldea -s /usr/sbin/nologin Fedra
#groupadd Aphroditaren_madarikazioa
#groupadd Semeordearen_eriotza
#groupadd ahizparen_desagertzea
#groupadd heroiaren_emaztea
#groupadd erregin_ezkontidea
#usermod -aG Aphroditaren_madarikazioa,Semeordearen_eriotza,ahizparen_desagertzea,\
#heroiaren_emaztea,erregin_ezkontidea Fedra

groupadd primary_group
useradd -M -N -r -g primary_group -s /usr/sbin/nologin Phaedra
groupadd Aphrodite_s_curse
groupadd death_of_the_Stepson
groupadd disappearance_of_the_Sister
groupadd wife_of_the_Hero
groupadd queen_regent
usermod -aG Aphrodite_s_curse,death_of_the_Stepson,disappearance_of_the_Sister,wife_of_the_Hero,queen_regent Phaedra



