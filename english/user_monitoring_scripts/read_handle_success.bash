# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Oh, my brave hero," \
		"finest among all," \
		"the moment I saw you," \
		"I knew you’d stand tall;" \
		"that your cunning could rival" \
		"the architect’s design," \
		"that this labyrinth will be trumped;" \
		"your skills refined." \
		"Username: the" \
		"Password: whole_freaking" > /home/read/lock/thread
	cat /home/read/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/read/lock /home/read/open_door
	mv /home/read/objective /home/read/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
