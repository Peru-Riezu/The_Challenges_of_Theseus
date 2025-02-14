# de facto there is a sources handle_success.bash here
get_success_lock_might_return

proper_solution()
{
	if [ $# -ne 1 ]
	then
		printf "Error, 2_1337_f0r_y0u must be run with exactly one argument\n"
		return 1
	fi

	figlet -- "$1" | cowsay -n
}

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear

############################################### test 1º ##################################################################
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (1/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u "_________hello_________" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution "_________hello_________")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u _ezegokia
		printf "%s%s\n" "/home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u " \
			"\"_________hello_________\"" \
			> /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (1/5): erantzun ezegokia."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		yield_success_lock
		return 0
	fi

############################################### test 2º ##################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (2/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u "_________hello_________" "extra" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution "_________hello_________" "extra")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u _ezegokia
		printf "%s%s\n" "/home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u " \
			"\"_________hello_________\" \"extra\"" \
			> /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (2/5): erantzun ezegokia."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		yield_success_lock
		return 0
	fi

############################################### test 3º ##################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (3/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u "" "" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution "" "")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u _ezegokia
		printf "%s%s\n" "/home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u " \
			"\"\" \"\"" \
			> /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (3/5): erantzun ezegokia."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		yield_success_lock
		return 0
	fi

############################################### test 4º ##################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (4/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u "" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$()
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u _ezegokia
		printf "%s%s\n" "/home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u " \
			"\"\"" \
			> /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (4/5): erantzun ezegokia."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		yield_success_lock
		return 0
	fi

############################################### test 5º ##################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (5/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution )
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u _ezegokia
		printf "%s%s\n" "/home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/2_1337_f0r_y0u " \
			"" \
			> /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako
		move_to_suffix /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (5/5): erantzun ezegokia."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		yield_success_lock
		return 0
	fi

############################################## success ###################################################################
	rm /user_shell_files/output
	tput clear
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Ardo-larru irekia," \
		"ulertutako profezia." \
		"" \
		"Jakitea eta ulertzea" \
		"da bizitza honetako" \
		"boterearen egia." \
		"erabiltzailea: Harrisonen_kronometroa" \
		"pasahitza: segundo_bat_gauerdirako" > /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/haria
	cat /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Gaiu_Itsasaldi-Aurresatzailea/aurkezpen_ontzia/ /home/Gaiu_Itsasaldi-Aurresatzailea/ate_irekia
	mv /home/Gaiu_Itsasaldi-Aurresatzailea/helburua /home/Gaiu_Itsasaldi-Aurresatzailea/helburu_lortua
	cd
	tput clear
	tput cnorm

	touch /user_shell_files/Gaiu_Itsasaldi-Aurresatzailea_success
fi

yield_success_lock

