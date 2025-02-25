# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Oh, my dear son," \
		"That day I gave consent," \
		"Yet now my heart is filled with regret..." \
		"To that cursed isle you went!" \
		""
		"――――――――――――――――――――――――" \
		""
		"Southern winds now shape the tide,"
		"For sails of white, on the gods I confide."
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
