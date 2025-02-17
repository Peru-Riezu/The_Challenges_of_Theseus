# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n" \
		"The riddle is solved, yet the path is not clear," \
		"For another trial awaits so near." \
		"Username: read" \
		"and" \
		"Password: always" \
		"Are the keys to press on against fear." > /home/center_of_the_labyrinth/lock/thread
	cat /home/center_of_the_labyrinth/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/center_of_the_labyrinth/lock /home/center_of_the_labyrinth/open_door
	mv /home/center_of_the_labyrinth/objective /home/center_of_the_labyrinth/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
