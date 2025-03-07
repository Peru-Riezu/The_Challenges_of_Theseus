# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Oh, my radiant hero," \
		"the sun’s beloved light," \
		"none shall ever shine as bright." \
		"" \
		"How could I leave you lost inside?" \
		"Take this thread," \
		"follow its guide." \
		"When you reach me," \
		"I’ll at last, be by your side." \
		"" \
		"Carry this sword," \
		"my love, my dear." \
		"For the beast and our fears," \
		"the end is near." \
		"erabiltzailea: Bombe" \
		"pasahitza: Bombe_was_not_turing_complete" > /home/Z3/lock/thread
	cat /home/Z3/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Z3/lock /home/Z3/open_door
	mv /home/Z3/objective /home/Z3/objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
