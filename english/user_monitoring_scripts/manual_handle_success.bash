# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"New weapons are always unknown," \
		"Yet with work, they become your own." \
		"Using many is common and wise," \
		"But master one, and watch it rise." \
		"" \
		"If another weapon draws your eye," \
		"Fear not change, just give it a try." \
		"" \
		"Yet if you wish to know my advice," \
		"Go with vi, both swift and precise." \
		"user: git" \
		"password: gud" > /home/manual/lock/thread
	cat /home/manual/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/manual/lock /home/manual/open_door
	mv /home/manual/objective /home/manual/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
