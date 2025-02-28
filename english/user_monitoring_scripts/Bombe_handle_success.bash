# de facto there is a sources handle_success.bash here

get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n"\
		"My son, hear me well," \
		"for this I'll speak in whispers:" \
		"" \
		"Right after you were conceived," \
		"I went alone to the sea." \
		"" \
		"To its power, I made my plea:" \
		"\"Let him be strong, let him be wise," \
		"let nothing stand beyond his might.\"" \
		"" \
		"I offered all I had to give," \
		"and the sea took what it willed." \
		"" \
		"My heart rejoices now," \
		"for I see—" \
		"our pact stands fulfilled," \
		"And that I managed to give you," \
		"everything you need, to be happy." \
		"erabiltzailea: Sir_Tim_Berners-Lee" \
		"pasahitza: www" > /home/Bombe/lock/thread
	cat /home/Bombe/lock/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Bombe/lock /home/Bombe/open_door
	mv /home/Bombe/objective /home/Bombe/achieved_objective
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
