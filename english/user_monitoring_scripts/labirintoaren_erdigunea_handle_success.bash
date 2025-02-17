# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n" \
		"Asmakizun hau gainditu duzu" \
		"hurrengo erronkara nahi baldinba duzu jarraitu" \
		"erabiltzailea: irakurri" \
		"eta" \
		"pasahitza: beti" \
		"erabili beharko dituzu" > /home/labirintoaren_erdigunea/sarraila/haria
	cat /home/labirintoaren_erdigunea/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/labirintoaren_erdigunea/sarraila /home/labirintoaren_erdigunea/ate_irekia
	mv /home/labirintoaren_erdigunea/helburua /home/labirintoaren_erdigunea/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
