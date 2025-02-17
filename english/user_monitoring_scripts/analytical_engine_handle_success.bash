# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Oh, seme enea," \
		"uharte madarikatu horretara joateko" \
		"baimena zergatik eman nizun nik?" \
		"" \
		"Haizea egoaldetik ekartzen du itsasoak," \
		"ze koloreko haize-ohial ekarriko du etorkizunak?"\
		"erabiltzailea: Z3" \
		"pasahitza: Konrad_Zuse" > /home/analytical_engine/sarraila/haria
	cat /home/analytical_engine/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/analytical_engine/sarraila /home/analytical_engine/ate_irekia
	mv /home/analytical_engine/helburua /home/analytical_engine/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
