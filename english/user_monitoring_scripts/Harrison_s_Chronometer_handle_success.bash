# de facto there is a sources handle_success.bash here

get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"How straight and easy is the dive to the infernal low," \
		"If going back upward were as effortless," \
		"This thread would not be such a giver of hope." \
		"user: Antikythera_mechanism" \
		"password: Machaneus" > /home/Harrison_s_Chronometer/lock/thread
	cat /home/Harrison_s_Chronometer/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Harrison_s_Chronometer/lock /home/Harrison_s_Chronometer/open_door
	mv /home/Harrison_s_Chronometer/objective /home/Harrison_s_Chronometer/objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
