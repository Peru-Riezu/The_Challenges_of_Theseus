# de facto there is a sources handle_success.bash here

get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Zein zuzen eta erraz" \
		"infernura jaistea." \
		"" \
		"Baina igotzea berriz," \
		"horren erraza balitz," \
		"hari hau ez nukeen beharko." \
		"erabiltzailea: Antikythera_mechanism" \
		"pasahitza: Machaneus" > /home/Harrison_s_Chronometer/sarraila/haria
	cat /home/Harrison_s_Chronometer/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Harrison_s_Chronometer/sarraila /home/Harrison_s_Chronometer/ate_irekia
	mv /home/Harrison_s_Chronometer/helburua /home/Harrison_s_Chronometer/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
