# de facto there is a sources handle_success.bash here
get_success_lock_might_exit

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear

	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (1/5)"

	animate_dots &
	DOTS_PID=$!

	/home/IBM_704/aurkezpen_ontzia/konponketa "echo kaixo Ludi" "cat <<< \"agur Ludi\"" &> /user_shell_files/output

	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo kaixo Ludi ; cat <<< "agur Ludi")
	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/konponketa _ezegokia
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/aurkezpen_ontzia/esperozen_outputa
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output lortutako
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/lortutako _outputa
		sleep 3
		kill $DOTS_PID
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (1/5): konponketa ezegokia."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
	else
		sleep 3
		rm /user_shell_files/output
		kill $DOTS_PID
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
		touch /user_shell_files/IBM_704_success
		cd
		tput clear
		tput cnorm
	fi
fi

yield_success_lock
