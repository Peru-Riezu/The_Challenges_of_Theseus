# de facto there is a sources handle_success.bash here
get_success_lock_might_return

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

	timeout 0.5 /home/IBM_704/aurkezpen_ontzia/erantzuna "echo Kaixo, Ludi" "cat <<< \"Agur, Ludi\"" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "Kaixo, Ludi" ; cat <<< "Agur, Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/aurkezpen_ontzia/erantzuna /home/IBM_704/aurkezpen_ontzia/erantzun
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/erantzun _ezegokia
		printf "%s%s\n" "/home/IBM_704/aurkezpen_ontzia/erantzuna " \
			"\"echo Kaixo, Ludi\" \"cat <<< \\\"Agur, Ludi\\\"\"" \
			> /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
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

############################################## test 2º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (2/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/IBM_704/aurkezpen_ontzia/erantzuna "echo kaixo Ludi" "" &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "kaixo Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/aurkezpen_ontzia/erantzuna /home/IBM_704/aurkezpen_ontzia/erantzun
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/erantzun _ezegokia
		printf "%s%s\n" "/home/IBM_704/aurkezpen_ontzia/erantzuna " \
			"\"echo kaixo Ludi\" \"\""
			> /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
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

############################################## test 3º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (3/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/IBM_704/aurkezpen_ontzia/erantzuna "" "echo kaixo Ludi" "" &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "kaixo Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/aurkezpen_ontzia/erantzuna /home/IBM_704/aurkezpen_ontzia/erantzun
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/erantzun _ezegokia
		printf "%s%s\n" "/home/IBM_704/aurkezpen_ontzia/erantzuna " \
			"\"\" \"echo kaixo Ludi\" \"\"" \
			> /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
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

############################################## test 4º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (4/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/IBM_704/aurkezpen_ontzia/erantzuna &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$()
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/aurkezpen_ontzia/erantzuna /home/IBM_704/aurkezpen_ontzia/erantzun
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/erantzun _ezegokia
		printf "/home/IBM_704/aurkezpen_ontzia/erantzuna\n" > /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
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

############################################## test 5º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (5/5)"

	animate_dots &
	DOTS_PID=$!

	PS_OUT=$(ps u)
	ORIGINAL_PS_COUNT=$(cat <<< "$PS_OUT" | tail -n +2 | wc -l)
	PS_OUT=$(timeout 3.5 /home/IBM_704/aurkezpen_ontzia/erantzuna "sleep 3 | cat" | (sleep .5 && ps u))
	GOTTEN_PS_COUNT=$(cat <<< "$PS_OUT" | tail -n +2 | wc -l)
	EXPECTED_COUNT=$(expr $ORIGINAL_PS_COUNT + 4)
	kill $DOTS_PID

	if [[ "$GOTTEN_PS_COUNT" != "$EXPECTED_COUNT" ]]; then
		mv /home/IBM_704/aurkezpen_ontzia/erantzuna /home/IBM_704/aurkezpen_ontzia/erantzun
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/erantzun _ezegokia
		printf "ps u | tail -n + 2 | wc -l\n" > /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_COUNT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		printf "$GOTTEN_PS_COUNT\n" > /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
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
	printf "%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Itsasontzi batean etorri," \
		"zeharkatu itsasoa azkarrki." \
		"" \
		"Baina inoiz al da gizon bera," \
		"egiten dena itzuli?" \
		"erabiltzailea: Gaiu_Itsasaldi-Aurresatzailea" \
		"pasahitza: Lord_Kelvin" > /home/IBM_704/aurkezpen_ontzia/haria
	cat /home/IBM_704/aurkezpen_ontzia/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/IBM_704/aurkezpen_ontzia/ /home/IBM_704/ate_irekia
	mv /home/IBM_704/helburua /home/IBM_704/helburu_lortua
	cd
	tput clear
	tput cnorm

	touch /user_shell_files/IBM_704_success
fi

yield_success_lock
