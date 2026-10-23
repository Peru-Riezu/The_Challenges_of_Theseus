# de facto there is a sources handle_success.bash here
get_success_lock_might_return

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

	timeout 0.5 /home/IBM_704/submission_box/solution "echo Hello, World" "cat <<< \"Goodby, World\"" \
		&> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "Hello, World" ; cat <<< "Goodby, World")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/submission_box/solution /home/IBM_704/submission_box/incorrect
		move_to_suffix /home/IBM_704/submission_box/incorrect _solution
		printf "%s%s\n" "/home/IBM_704/submission_box/solution " \
			"\"echo Hello, World\" \"cat <<< \\\"Goodby, World\\\"\"" \
			> /home/IBM_704/submission_box/given
		move_to_suffix /home/IBM_704/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/submission_box/expected
		move_to_suffix /home/IBM_704/submission_box/expected _output
		mv /user_shell_files/output /home/IBM_704/submission_box/gotten
		move_to_suffix /home/IBM_704/submission_box/gotten _output
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

############################################## test 2º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"testing (2/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/IBM_704/submission_box/solution "echo kaixo Ludi" "" &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "kaixo Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/submission_box/solution /home/IBM_704/submission_box/incorrect
		move_to_suffix /home/IBM_704/submission_box/incorrect _solution
		printf "%s%s\n" "/home/IBM_704/submission_box/solution " \
			"\"echo kaixo Ludi\" \"\""
			> /home/IBM_704/submission_box/given
		move_to_suffix /home/IBM_704/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/submission_box/expected
		move_to_suffix /home/IBM_704/submission_box/expected _output
		mv /user_shell_files/output /home/IBM_704/submission_box/gotten
		move_to_suffix /home/IBM_704/submission_box/gotten _output
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

############################################## test 3º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"testing (3/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/IBM_704/submission_box/solution "" "echo kaixo Ludi" "" &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo "kaixo Ludi")
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/submission_box/solution /home/IBM_704/submission_box/incorrect
		move_to_suffix /home/IBM_704/submission_box/incorrect _solution
		printf "%s%s\n" "/home/IBM_704/submission_box/solution " \
			"\"\" \"echo kaixo Ludi\" \"\"" \
			> /home/IBM_704/submission_box/given
		move_to_suffix /home/IBM_704/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/submission_box/expected
		move_to_suffix /home/IBM_704/submission_box/expected _output
		mv /user_shell_files/output /home/IBM_704/submission_box/gotten
		move_to_suffix /home/IBM_704/submission_box/gotten _output
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

############################################## test 4º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"testing (4/5)"

	animate_dots &
	DOTS_PID=$!

	timeout 0.5 /home/IBM_704/submission_box/solution &> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$()
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		mv /home/IBM_704/submission_box/solution /home/IBM_704/submission_box/incorrect
		move_to_suffix /home/IBM_704/submission_box/incorrect _solution
		printf "/home/IBM_704/submission_box/solution\n" > /home/IBM_704/submission_box/given
		move_to_suffix /home/IBM_704/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/IBM_704/submission_box/expected
		move_to_suffix /home/IBM_704/submission_box/expected _output
		mv /user_shell_files/output /home/IBM_704/submission_box/gotten
		move_to_suffix /home/IBM_704/submission_box/gotten _output
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

############################################## test 5º ###################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"testing (5/5)"

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
			"test (5/5): could not measure the reference processes."
		printf "exit status: %s\nPID PPID COMMAND\n%s\n" "$REFERENCE_STATUS" "$EXPECTED_PS_OUT"
		cat /user_shell_files/output
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		yield_success_lock
		return 0
	fi

	measure_process_count /home/IBM_704/submission_box/solution "sleep 3 | cat" ":"
	GOTTEN_PS_COUNT=$PROCESS_COUNT
	GOTTEN_PS_OUT=$PROCESS_LIST
	SUBMISSION_READY=$PROCESS_READY
	SUBMISSION_STATUS=$PROCESS_STATUS
	kill "$DOTS_PID"
	wait "$DOTS_PID" 2>/dev/null || :

	if [[ "$SUBMISSION_READY" != 1 || "$SUBMISSION_STATUS" -ne 0 || "$GOTTEN_PS_COUNT" != "$EXPECTED_COUNT" ]]; then
		mv /home/IBM_704/submission_box/solution /home/IBM_704/submission_box/incorrect
		move_to_suffix /home/IBM_704/submission_box/incorrect _solution
		printf "%s\n" '/home/IBM_704/submission_box/solution "sleep 3 | cat" ":"' \
			> /home/IBM_704/submission_box/given
		move_to_suffix /home/IBM_704/submission_box/given _input
		{
			printf "%s\nexit status: %s\n" "$EXPECTED_COUNT" "$REFERENCE_STATUS"
			printf "sleep and cat observed: %s\n" "$REFERENCE_READY"
			printf "PID PPID COMMAND\n%s\n" "$EXPECTED_PS_OUT"
		} > /home/IBM_704/submission_box/expected
		move_to_suffix /home/IBM_704/submission_box/expected _output
		{
			printf "%s\nexit status: %s\n" "$GOTTEN_PS_COUNT" "$SUBMISSION_STATUS"
			printf "sleep and cat observed: %s\n" "$SUBMISSION_READY"
			printf "PID PPID COMMAND\n%s\n" "$GOTTEN_PS_OUT"
			printf "\nCommand output:\n"
			cat /user_shell_files/output
		} > /home/IBM_704/submission_box/gotten
		move_to_suffix /home/IBM_704/submission_box/gotten _output
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
	printf "%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"He returned aboard the ship," \
		"swiftly crossing the sea." \
		"" \
		"He'd grown so wise, so bold, so grand." \
		"Was he the same man we once saw depart?" \
		"user: Tide-predicting_machine" \
		"password: Lord_Kelvin" > /home/IBM_704/submission_box/thread
	cat /home/IBM_704/submission_box/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/IBM_704/submission_box/ /home/IBM_704/open_door
	mv /home/IBM_704/objective /home/IBM_704/achieved_objective
	cd
	tput clear
	tput cnorm

	touch /user_shell_files/IBM_704_success
fi

yield_success_lock

