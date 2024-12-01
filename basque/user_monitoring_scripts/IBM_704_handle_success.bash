COLOR_GREEN="\033[32m"
COLOR_RED="\033[31m"
COLOR_RESET="\033[0m"

animate_dots()
{
	while true; do
		for dots in '   ' '.  ' '.. ' '...'; do
			flock 201
			echo -ne "\b\b\b$dots"
			flock -u 201
			sleep 0.5
		done
	done
}

move_to_suffix()
{
	local basename="$1"
	local suffix="$2"
	local target="${basename}${suffix}"
	local n=1

	while [[ -e "$target" ]]; do
		target="${basename}${suffix}(${n})"
		((n++))
	done
	mv "$basename" "$target"
}

touch /user_shell_files/shells_working

exec 200>/user_shell_files/lock
exec 201>/user_shell_files/print_lock
flock 200
FILE="/user_shell_files/user_shell_count"
if [ ! -f "$FILE" ]; then
    echo 0 > "$FILE"
fi
CURRENT_VALUE=$(cat "$FILE")
NEW_VALUE=$((CURRENT_VALUE + 1))
echo "$NEW_VALUE" > "$FILE"
flock -u 200

my_pgid=$(ps -o pgid= -p $$)
fg_pgid=$(ps -o tpgid= -p $$)
my_pgid=$(echo "$my_pgid" | tr -d '[:space:]')
fg_pgid=$(echo "$fg_pgid" | tr -d '[:space:]')

while [ "$my_pgid" -ne "$fg_pgid" ]; do
	if [ ! -f "/user_shell_files/foreground_activated" ]; then
		flock 200
		FILE="/user_shell_files/user_shell_count"
		CURRENT_VALUE=$(cat "$FILE")
		if [ "$CURRENT_VALUE" -eq 1 ]; then
			rm /user_shell_files/foreground_activated
			rm /user_shell_files/shells_working
			rm "$FILE"
		else
			NEW_VALUE=$((CURRENT_VALUE - 1))
			echo "$NEW_VALUE" > "$FILE"
		fi
		flock -u 200
		exit 0
	fi

	sleep 0.01

	my_pgid=$(ps -o pgid= -p $$)
	fg_pgid=$(ps -o tpgid= -p $$)
	my_pgid=$(echo "$my_pgid" | tr -d '[:space:]')
	fg_pgid=$(echo "$fg_pgid" | tr -d '[:space:]')
done

flock 200
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

	EXPECTED_CONTENT=$(echo kaixo Ludi ; cat <<< "agur Ludi")
	if [[ "$FILE_CONTENT" != "$EXPECTED_CONTENT" ]]; then
		sleep 3
		rm /user_shell_files/output
		move_to_suffix /home/IBM_704/aurkezpen_ontzia/konponketa _ezegokia
		kill $DOTS_PID
		flock 201
		tput clear
		printf "$COLOR_RED%s$COLOR_RESET\n" \
			"froga (1/5): konponketa ezegokia."
		flock -u 201
		stty -igncr
		read -s -r -n1
		stty sane
		tput clear
		tput cnorm
		return
	fi

	sleep 3
	rm /user_shell_files/output
	kill $DOTS_PID

	printf "%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"asmakizun hau gainditu duzu" \
		"erabiltzailea: " \
		"pasahitza: " > /home/Bombe/sarraila/haria
	cat /home/Bombe/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Bombe/sarraila /home/Bombe/ate_irekia
	mv /home/Bombe/helburua /home/Bombe/helburu_lortua
	cd
	tput clear
	tput cnorm
fi
FILE="/user_shell_files/user_shell_count"
CURRENT_VALUE=$(cat "$FILE")
if [ "$CURRENT_VALUE" -eq 1 ]; then
	rm /user_shell_files/foreground_activated
	rm /user_shell_files/shells_working
	rm "$FILE"
else
	NEW_VALUE=$((CURRENT_VALUE - 1))
	echo "$NEW_VALUE" > "$FILE"
fi
flock -u 200
