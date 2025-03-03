# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"In silence, I cast my gaze behind," \
		"And there it stands—the golden lion’s hide." \
		"" \
		"My courage—" \
		"if that is what I may call" \
		"the folly that led me to it all." \
		"" \
		"Yet each time memory pulls me back," \
		"I see that steadfast man who laughed…" \
		"How bright he shined—" \
		"I knew then what I wished to be," \
		"since never has doubt taken hold of me." \
		"erabiltzailea: IBM_704" \
		"pasahitza: GM-NAA_I/O" > /home/Sir_Tim_Berners-Lee/sarraila/haria
	cat /home/Sir_Tim_Berners-Lee/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Sir_Tim_Berners-Lee/sarraila /home/Sir_Tim_Berners-Lee/ate_irekia
	mv /home/Sir_Tim_Berners-Lee/helburua /home/Sir_Tim_Berners-Lee/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
