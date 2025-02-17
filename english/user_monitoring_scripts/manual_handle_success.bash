# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Arma berriak beti dira ezezagun" \
		"baino lanarekin bilakatzen dira zure lagun" \
		"arma asko erabiltzea da ohikoa" \
		"bat hautatu eta bilakatu boteretsua" \
		"arma beste batek sortzen badizu lilura" \
		"ez izan aldatzeari beldurra" \
		"eta ezagutu nahi baduzu nire aukera" \
		"vi da armen artean nire maitea " \
		"erabiltzailea: git" \
		"pasahitza: gud" > /home/manual/sarraila/haria
	cat /home/manual/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/manual/sarraila /home/manual/ate_irekia
	mv /home/manual/helburua /home/manual/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
