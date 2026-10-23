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

	measure_process_count bash -c 'eval "$1"; eval "$2"' _ "sleep 3 | cat" ":"
	EXPECTED_COUNT=$PROCESS_COUNT
	EXPECTED_PS_OUT=$PROCESS_LIST
	REFERENCE_READY=$PROCESS_READY
	REFERENCE_STATUS=$PROCESS_STATUS
	if [[ "$REFERENCE_READY" != 1 || "$REFERENCE_STATUS" -ne 0 ]]; then
		kill "$DOTS_PID"
		wait "$DOTS_PID" 2>/dev/null || :
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (5/5): ezin izan dira erreferentziako prozesuak neurtu."
		printf "irteera kodea: %s\nPID PPID COMMAND\n%s\n" "$REFERENCE_STATUS" "$EXPECTED_PS_OUT"
		cat /user_shell_files/output
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		yield_success_lock
		return 0
	fi

	measure_process_count /home/IBM_704/aurkezpen_ontzia/erantzuna "sleep 3 | cat" ":"
	GOTTEN_PS_COUNT=$PROCESS_COUNT
	GOTTEN_PS_OUT=$PROCESS_LIST
	SUBMISSION_READY=$PROCESS_READY
	SUBMISSION_STATUS=$PROCESS_STATUS
	kill "$DOTS_PID"
	wait "$DOTS_PID" 2>/dev/null || :

	if [[ "$SUBMISSION_READY" != 1 || "$SUBMISSION_STATUS" -ne 0 || "$GOTTEN_PS_COUNT" != "$EXPECTED_COUNT" ]]; then
		mv /home/IBM_704/aurkezpen_ontzia/erantzuna /home/IBM_704/aurkezpen_ontzia/erantzun
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/erantzun _ezegokia
		printf "%s\n" '/home/IBM_704/aurkezpen_ontzia/erantzuna "sleep 3 | cat" ":"' \
			> /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		{
			printf "%s\nirteera kodea: %s\n" "$EXPECTED_COUNT" "$REFERENCE_STATUS"
			printf "sleep eta cat ikusi dira: %s\n" "$REFERENCE_READY"
			printf "PID PPID COMMAND\n%s\n" "$EXPECTED_PS_OUT"
		} > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		{
			printf "%s\nirteera kodea: %s\n" "$GOTTEN_PS_COUNT" "$SUBMISSION_STATUS"
			printf "sleep eta cat ikusi dira: %s\n" "$SUBMISSION_READY"
			printf "PID PPID COMMAND\n%s\n" "$GOTTEN_PS_OUT"
			printf "\nKomandoaren irteera:\n"
			cat /user_shell_files/output
		} > /home/IBM_704/aurkezpen_ontzia/lortutako
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

