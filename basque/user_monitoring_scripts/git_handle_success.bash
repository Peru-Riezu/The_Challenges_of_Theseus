# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	mkdir /home/git/ate_irekia
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Lurrak gorde du iragana," \
		"isilean, harriaren pean." \
		"Itzalean egon da, ezkutuan," \
		"baina hazi dena iritsiko da harengana." \
		"" \
		"Ez da galdu, ez da ahaztu," \
		"zure ondarea, zure patua." \
		"erabiltzailea: eragile_analitikoa" \
		"pasahitza: Charles_Babbage" > /home/git/ate_irekia/haria
	cat /home/git/ate_irekia/haria
	stty -igncr
	read -s -r -n1
	chown -R git ate_irekia
	stty sane
	mv /home/git/helburua /home/git/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
