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
		"testing (1/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u "_________hello_________" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution "_________hello_________")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u \
			/home/Tide-predicting_machine/submission_box/incorrect
		move_to_suffix /home/Tide-predicting_machine/submission_box/incorrect _2_1337_f0r_y0u
		printf "%s%s\n" "/home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u " \
			"\"_________hello_________\"" \
			> /home/Tide-predicting_machine/submission_box/given
		move_to_suffix /home/Tide-predicting_machine/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/Tide-predicting_machine/submission_box/expected
		move_to_suffix /home/Tide-predicting_machine/submission_box/expected _output
		mv /user_shell_files/output /home/Tide-predicting_machine/submission_box/gotten
		move_to_suffix /home/Tide-predicting_machine/submission_box/gotten _output
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"test (1/5): incorrect solution."
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
		"testing (2/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u "_________hello_________" "extra" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution "_________hello_________" "extra")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u \
			/home/Tide-predicting_machine/submission_box/incorrect
		move_to_suffix /home/Tide-predicting_machine/submission_box/incorrect _2_1337_f0r_y0u
		printf "%s%s\n" "/home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u " \
			"\"_________hello_________\" \"extra\"" \
			> /home/Tide-predicting_machine/submission_box/given
		move_to_suffix /home/Tide-predicting_machine/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/Tide-predicting_machine/submission_box/expected
		move_to_suffix /home/Tide-predicting_machine/submission_box/expected _output
		mv /user_shell_files/output /home/Tide-predicting_machine/submission_box/gotten
		move_to_suffix /home/Tide-predicting_machine/submission_box/gotten _output
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"test (2/5): incorrect solution."
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
		"testing (3/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u "" "" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution "" "")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u \
			/home/Tide-predicting_machine/submission_box/incorrect
		move_to_suffix /home/Tide-predicting_machine/submission_box/incorrect _2_1337_f0r_y0u
		printf "%s%s\n" "/home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u " \
			"\"\" \"\"" \
			> /home/Tide-predicting_machine/submission_box/given
		move_to_suffix /home/Tide-predicting_machine/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/Tide-predicting_machine/submission_box/expected
		move_to_suffix /home/Tide-predicting_machine/submission_box/expected _output
		mv /user_shell_files/output /home/Tide-predicting_machine/submission_box/gotten
		move_to_suffix /home/Tide-predicting_machine/submission_box/gotten _output
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"test (3/5): incorrect solution."
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
		"testing (4/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u "" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution "")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u \
			/home/Tide-predicting_machine/submission_box/incorrect
		move_to_suffix /home/Tide-predicting_machine/submission_box/incorrect _2_1337_f0r_y0u
		printf "%s%s\n" "/home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u " \
			"\"\"" \
			> /home/Tide-predicting_machine/submission_box/given
		move_to_suffix /home/Tide-predicting_machine/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/Tide-predicting_machine/submission_box/expected
		move_to_suffix /home/Tide-predicting_machine/submission_box/expected _output
		mv /user_shell_files/output /home/Tide-predicting_machine/submission_box/gotten
		move_to_suffix /home/Tide-predicting_machine/submission_box/gotten _output
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"test (4/5): incorrect solution."
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
		"testing (5/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(proper_solution )
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u \
			/home/Tide-predicting_machine/submission_box/incorrect
		move_to_suffix /home/Tide-predicting_machine/submission_box/incorrect _2_1337_f0r_y0u
		printf "%s%s\n" "/home/Tide-predicting_machine/submission_box/2_1337_f0r_y0u " \
			"" \
			> /home/Tide-predicting_machine/submission_box/given
		move_to_suffix /home/Tide-predicting_machine/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/Tide-predicting_machine/submission_box/expected
		move_to_suffix /home/Tide-predicting_machine/submission_box/expected _output
		mv /user_shell_files/output /home/Tide-predicting_machine/submission_box/gotten
		move_to_suffix /home/Tide-predicting_machine/submission_box/gotten _output
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"test (5/5): incorrect solution."
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
	printf "%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"An open wineskin, a prophecy seen clear,"\
		"To know and understand; makes life's true power, appear."\
		"user: Harrison_s_Chronometer" \
		"password: a_second_to_midnight" > /home/Tide-predicting_machine/submission_box/thread
	cat /home/Tide-predicting_machine/submission_box/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Tide-predicting_machine/submission_box/ /home/Tide-predicting_machine/open_door
	mv /home/Tide-predicting_machine/objective /home/Tide-predicting_machine/achieved_objective
	cd
	tput clear
	tput cnorm

	touch /user_shell_files/Tide-predicting_machine_success
fi

yield_success_lock

