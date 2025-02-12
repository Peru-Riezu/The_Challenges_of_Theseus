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
		"erabiltzailea: Antiziterako_mekanismoa" \
		"pasahitza: Machaneus" > /home/Harrisonen_kronometroa/sarraila/haria
	cat /home/Harrisonen_kronometroa/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Harrisonen_kronometroa/sarraila /home/Harrisonen_kronometroa/ate_irekia
	mv /home/Harrisonen_kronometroa/helburua /home/Harrisonen_kronometroa/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
