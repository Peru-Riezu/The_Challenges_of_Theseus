# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"My son, loved, with all the love I bear," \
		"Take these wings and go be free in the sky." \
		"But soar too close to the warm light," \
		"And surely, my child, you’ll fall and die." \
		"user: manual" \
		"password: I_like_manuals" > /home/the/lock/thread
	cat /home/the/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/the/lock /home/the/open_door
	mv /home/the/objective /home/the/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
