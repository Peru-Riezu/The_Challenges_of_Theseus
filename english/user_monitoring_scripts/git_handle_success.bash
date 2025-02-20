# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	mkdir /home/git/open_door
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"The past lies buried beneath the stone," \
		"Silent, hidden, yet never unknown." \
		"Shrouded deep, concealed from sight," \
		"Until you grow strong to lift it right." \
		"" \
		"Neither lost, nor cast away," \
		"Your birthright waits," \
		"Your fate remains." \
		"erabiltzailea: analytical_engine" \
		"pasahitza: Charles_Babbage" > /home/git/open_door/thread
	cat /home/git/open_door/thread
	stty -igncr
	read -s -r -n1
	chown -R git ate_irekia
	stty sane
	mv /home/git/objective /home/git/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
