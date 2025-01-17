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

	/home/IBM_704/aurkezpen_ontzia/konponketa "echo kaixo Ludi" "cat <<< \"agur Ludi\"" &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "kaixo Ludi" ; cat <<< "agur Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/konponketa _ezegokia
		printf "%s%s" "/home/IBM_704/aurkezpen_ontzia/konponketa " \
			"\"echo kaixo Ludi\" \"cat <<< \\\"agur Ludi\\\"\"\n" \
			> /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (1/5): konponketa ezegokia."
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

	/home/IBM_704/aurkezpen_ontzia/konponketa "echo kaixo Ludi" "" &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "kaixo Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/konponketa _ezegokia
		printf "%s%s" "/home/IBM_704/aurkezpen_ontzia/konponketa " \
			"\"echo kaixo Ludi\" \"\"\n"
			> /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (2/5): konponketa ezegokia."
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

	/home/IBM_704/aurkezpen_ontzia/konponketa "" "echo kaixo Ludi" "" &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "kaixo Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/konponketa _ezegokia
		printf "%s%s" "/home/IBM_704/aurkezpen_ontzia/konponketa " \
			"\"\" \"echo kaixo Ludi\" \"\"\n" \
			> /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (3/5): konponketa ezegokia."
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

	/home/IBM_704/aurkezpen_ontzia/konponketa &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$()
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/konponketa _ezegokia
		printf "/home/IBM_704/aurkezpen_ontzia/konponketa\n" > /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (4/5): konponketa ezegokia."
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

	ORIGINAL_PS_COUNT=$(ps u |  tail -n +2 | wc -l)
	GOTTEN_PS_COUNT=$(/home/IBM_704/aurkezpen_ontzia/konponketa "cat | sleep 3" | ps u | tail -n +2 | wc -l)
	EXPECTED_COUNT=$(expr $ORIGINAL_PS_COUNT + 3)
	sleep 3
	kill $DOTS_PID

	if [[ "$GOTTEN_PS_COUNT" != "$EXPECTED_COUNT" ]]; then
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/konponketa _ezegokia
		printf "ps u | tail -n + 2 | wc -l\n" > /home/IBM_704/aurkezpen_ontzia/emandako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_COUNT" > /home/IBM_704/aurkezpen_ontzia/esperozen
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		printf "$GOTTEN_PS_COUNT\n" > /home/IBM_704/aurkezpen_ontzia/lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (5/5): konponketa ezegokia."
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
	printf "%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"asmakizun hau gainditu duzu" \
		"erabiltzailea: " \
		"pasahitza: " > /home/IBM_704/aurkezpen_ontzia/haria
	cat /home/IBM_704/aurkezpen_ontzia/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/IBM_704/aurkezpen_ontzia/haria /home/Bombe/ate_irekia
	mv /home/IBM_704/helburua /home/IBM_704/helburu_lortua
	cd
	tput clear
	tput cnorm

	touch /user_shell_files/IBM_704_success
fi

yield_success_lock
