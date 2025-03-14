# de facto there is a sources handle_success.bash here
get_success_lock_might_return

check_dates()
{
	FAILURE=0
	for FILEPATH in "$@"
	do
		MOD_TIME=$(stat -c %y "$FILEPATH" 2> /dev/null)
		ACCESS_TIME=$(stat -c %x "$FILEPATH" 2> /dev/null)
		TARGET_DATE="1970-01-01 00:00:00.000000000 +0000"

		if [[ "$MOD_TIME" != "$TARGET_DATE" ]]
		then
			echo Error: the modification time of $FILEPATH is $MOD_TIME.
			FAILURE=1
		fi
		if [[ "$ACCESS_TIME" != "$TARGET_DATE" ]]
		then
			echo Error: the access time of $FILEPATH is $ACCESS_TIME.
			FAILURE=1
		fi
	done

	if [[ $FAILURE == 0 ]]
	then
		echo OK
	fi
}

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear

############################################### test 1º ##################################################################
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"testing (1/2)"

	animate_dots &
	DOTS_PID=$!

	mkdir /tmp/dir1
	touch /tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file4 /tmp/dir1/file5

	timeout 0.5 /home/Antikythera_mechanism/submission_box/solution /tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file3 \
		/error/error /tmp/dir1/file4 /error/error2 /tmp/dir1/file5 /error7/error6 &> /user_shell_files/output ; \
		check_dates /tmp/dir1/file1 /tmp/dir1/file2  /tmp/dir1/file3 /tmp/dir1/file4 /tmp/dir1/file5 \
		>> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo OK)
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]
	then
		mv /home/Antikythera_mechanism/submission_box/solution /home/Antikythera_mechanism/submission_box/incorrect
		move_to_suffix /home/Antikythera_mechanism/submission_box/incorrect _solution
		printf "%s\n%s\n%s\n%s\n%s\n" \
			"timeout 0.5 /home/Antikythera_mechanism/submission_box/solution \\" \
			"/tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file3 /error/error /tmp/dir1/file4 \\" \
			"/error/error2 /tmp/dir1/file5 /error7/error6 &> /user_shell_files/output; \\" \
			"check_dates /tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file3 /tmp/dir1/file4 \\" \
			"/tmp/dir1/file5 >> /user_shell_files/output" \
			> /home/Antikythera_mechanism/submission_box/given
		move_to_suffix /home/Antikythera_mechanism/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/Antikythera_mechanism/submission_box/expected
		move_to_suffix /home/Antikythera_mechanism/submission_box/expected _output
		mv /user_shell_files/output /home/Antikythera_mechanism/submission_box/gotten
		move_to_suffix /home/Antikythera_mechanism/submission_box/gotten _output
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"test (1/2): incorrect solution."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		rm -rf /tmp/dir1
		yield_success_lock
		return 0
	fi
	rm -rf /tmp/dir1

############################################### test 2º ##################################################################
	tput clear
	tput clear
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"testing (2/2)"

	animate_dots &
	DOTS_PID=$!

	mkdir -p /tmp/dir2/file1\ /dir2
	touch /tmp/dir2/file1\ /dir2/file2

	timeout 0.5 /home/Antikythera_mechanism/submission_box/solution "/tmp/dir2/file1 /dir2/file2" \
		/tmp/dir2/real_file1 &> /user_shell_files/output ; check_dates "/tmp/dir2/file1 /dir2/file2" \
		/tmp/dir2/real_file1 >> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo OK)
	sleep 4
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]
	then
		mv /home/Antikythera_mechanism/submission_box/solution /home/Antikythera_mechanism/submission_box/incorrect
		move_to_suffix /home/Antikythera_mechanism/submission_box/incorrect _solution
		printf "%s\n%s\n%s\n%s\n" \
			"timeout 0.5 /home/Antikythera_mechanism/submission_box/solution \\" \
			"\"/tmp/dir2/file1 /dir2/file2\"  /tmp/dir2/real_file1 \\" \
			"&> /user_shell_files/output ; check_dates "/tmp/dir2/file1 /dir2/file2" \\" \
			"/tmp/dir2/real_file1 >> /user_shell_files/output" \
			> /home/Antikythera_mechanism/submission_box/given
		move_to_suffix /home/Antikythera_mechanism/submission_box/given _input
		cat <<< "$EXPECTED_CONTENT" > /home/Antikythera_mechanism/submission_box/expected
		move_to_suffix /home/Antikythera_mechanism/submission_box/expected _output
		mv /user_shell_files/output /home/Antikythera_mechanism/submission_box/gotten
		move_to_suffix /home/Antikythera_mechanism/submission_box/gotten _output
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"test (2/2): incorrect solution."
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		rm -rf /tmp/dir2
		yield_success_lock
		return 0
	fi

############################################## success ###################################################################
	rm /user_shell_files/output
	tput clear
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Iris brought me, amid Dream’s embrace, great joy," \
		"No sweeter news could she have conveyed." \
		"" \
		"Our children still press forth," \
		"Sheltered behind our hero’s blade." \
		"" \
		"Oh, gods above, to you my endless praise!" \
		"This shall not be the final page" \
		"Of our children's tale." \
		"erabiltzailea: abacus" \
		"pasahitza: from_dust_to_dust" > /home/Antikythera_mechanism/submission_box/thread
	cat /home/Antikythera_mechanism/submission_box/thread
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Antikythera_mechanism/submission_box/ /home/Antikythera_mechanism/open_door
	mv /home/Antikythera_mechanism/objective /home/Antikythera_mechanism/achieved_objective
	cd
	tput clear
	tput cnorm

	touch /user_shell_files/Antikythera_mechanism_success
fi

yield_success_lock

