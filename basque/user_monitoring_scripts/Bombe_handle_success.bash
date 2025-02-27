# de facto there is a sources handle_success.bash here

get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Seme, zuk jakitea nahi dut nik," \
		"sabel barruan sortu zintudan ondoren," \
		"itsasora joan nintzen, bakarrik." \
		"" \
		"Eskatu nion han, itsaso boteretsuari:" \
		"zu indartsu eta adimentsu haztea," \
		"eta bizitzan edozer gainditzeko gai izatea." \
		"" \
		"Horretarako, eman nion itsasoari" \
		"emateko nituen guztien artetik," \
		"hark onartu zuena, pozik." \
		"" \
		"Bihotza pozten dit," \
		"ikusteak" \
		"akordioa bete duela guztiz." \
		"erabiltzailea: Sir_Tim_Berners-Lee" \
		"pasahitza: www" > /home/Bombe/sarraila/haria
	cat /home/Bombe/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Bombe/sarraila /home/Bombe/ate_irekia
	mv /home/Bombe/helburua /home/Bombe/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
