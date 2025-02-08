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
		"frogatzen (1/2)"

	animate_dots &
	DOTS_PID=$!

	mkdir /tmp/dir1
	touch /tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file4 /tmp/dir1/file5

	timeout 0.5 /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzuna /tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file3 \
		/error/error /tmp/dir1/file4 /error/error2 /tmp/dir1/file5 /error7/error6 &> /user_shell_files/output ; \
		check_dates /tmp/dir1/file1 /tmp/dir1/file2  /tmp/dir1/file3 /tmp/dir1/file4 /tmp/dir1/file5 \
		>> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo OK)
	sleep 3
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]
	then
		mv /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzuna \
			/home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzun
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzun _ezegokia
		printf "%s\n%s\n%s\n%s\n%s\n" \
			"timeout 0.5 /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzuna \\" \
			"/tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file3 /error/error /tmp/dir1/file4 \\" \
			"/error/error2 /tmp/dir1/file5 /error7/error6 &> /user_shell_files/output; \\" \
			"check_dates /tmp/dir1/file1 /tmp/dir1/file2 /tmp/dir1/file3 /tmp/dir1/file4 \\" \
			"/tmp/dir1/file5 >> /user_shell_files/output" \
			> /home/Antiziterako_mekanismoa/aurkezpen_ontzia/emandako
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/Antiziterako_mekanismoa/aurkezpen_ontzia/esperozen
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/Antiziterako_mekanismoa/aurkezpen_ontzia/lortutako
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (1/2): erantzun ezegokia."
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
	printf "$COLOR_GREEN%s$COLOR_RESET\n" \
		"frogatzen (2/2)"

	animate_dots &
	DOTS_PID=$!

	mkdir -p /tmp/dir2/file1\ /dir2
	touch /tmp/dir2/file1\ /dir2/file2

	timeout 0.5 /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzuna "/tmp/dir2/file1 /dir2/file2" \
		/tmp/dir2/real_file1 &> /user_shell_files/output ; check_dates "/tmp/dir2/file1 /dir2/file2" \
		/tmp/dir2/real_file1 >> /user_shell_files/output
	FILE_CONTENT=$(cat /user_shell_files/output)
	EXPECTED_CONTENT=$(echo OK)
	sleep 4
	kill $DOTS_PID

	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]
	then
		mv /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzuna \
			/home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzun
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzun _ezegokia
		printf "%s\n%s\n%s\n%s\n" \
			"timeout 0.5 /home/Antiziterako_mekanismoa/aurkezpen_ontzia/erantzuna \\" \
			"\"/tmp/dir2/file1 /dir2/file2\"  /tmp/dir2/real_file1 \\" \
			"&> /user_shell_files/output ; check_dates "/tmp/dir2/file1 /dir2/file2" \\" \
			"/tmp/dir2/real_file1 >> /user_shell_files/output" \
			> /home/Antiziterako_mekanismoa/aurkezpen_ontzia/emandako
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/emandako _inputa
		cat <<< "$EXPECTED_CONTENT" > /home/Antiziterako_mekanismoa/aurkezpen_ontzia/esperozen
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/esperozen _outputa
		mv /user_shell_files/output /home/Antiziterako_mekanismoa/aurkezpen_ontzia/lortutako
		move_to_suffix /home/Antiziterako_mekanismoa/aurkezpen_ontzia/lortutako _outputa
		tput clear
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (2/2): erantzun ezegokia."
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
	printf "%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"asmakizun hau gainditu duzu" \
		"erabiltzailea: abakoa" \
		"pasahitza: hautsetatik_hautsetara" > /home/Antiziterako_mekanismoa/aurkezpen_ontzia/haria
	cat /home/Antiziterako_mekanismoa/aurkezpen_ontzia/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Antiziterako_mekanismoa/aurkezpen_ontzia/ /home/Antiziterako_mekanismoa/ate_irekia
	mv /home/Antiziterako_mekanismoa/helburua /home/Antiziterako_mekanismoa/helburu_lortua
	cd
	tput clear
	tput cnorm

	touch /user_shell_files/Antiziterako_mekanismoa_success
fi

yield_success_lock

