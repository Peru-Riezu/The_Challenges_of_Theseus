# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"My heart trembles—can anyone say" \
		"What wyrd awaits me on this day?" \
		"Ari, Ari... what will we be?" \
		"Is this our flight to liberty," \
		"Or just another desperate chance" \
		"To flee the fate we’d meet here?" \
		"Will love and joy await us there," \
		"In that far land to which we steer?" \
		"erabiltzailea: inception" \
		"pasahitza: lunar_effect" \
		> /home/abacus/lock/thread
	cat /home/abacus/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/abacus/lock /home/abacus/open_door
	mv /home/abacus/objective /home/abacus/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
