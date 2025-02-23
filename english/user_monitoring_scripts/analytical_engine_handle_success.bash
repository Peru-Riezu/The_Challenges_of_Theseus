# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Oh, my dear son," \
		"that day I gave consent," \
		"to that cursed isle you went—" \
		"now my heart holds deep regret." \
		""\
		"Southern winds across the sea—" \
		"what sails will fate return to me?" \
		"user: Z3" \
		"password: Konrad_Zuse" > /home/analytical_engine/lock/thread
	cat /home/analytical_engine/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/analytical_engine/lock /home/analytical_engine/open_door
	mv /home/analytical_engine/objective /home/analytical_engine/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
