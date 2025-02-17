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
		"erabiltzailea: read" \
		"eta" \
		"pasahitza: always" \
		"erabili beharko dituzu" > /home/center_of_the_labyrinth/sarraila/haria
	cat /home/center_of_the_labyrinth/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/center_of_the_labyrinth/sarraila /home/center_of_the_labyrinth/ate_irekia
	mv /home/center_of_the_labyrinth/helburua /home/center_of_the_labyrinth/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
