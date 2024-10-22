COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

touch /user_shell_files/shells_working

exec 200>/user_shell_files/lock
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
	mkdir /home/git/ate_irekia
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"asmakizun hau gainditu duzu" \
		"hurrengo ariketa preskuntzan ez dago prest oraindik" \
		"erabiltzailea: Bombe" \
		"pasahitza: the_Bombe_device_was_not_turing_complete" > /home/Z3/sarraila/haria
	cat /home/Z3/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Z3/sarraila /home/Z3/ate_irekia
	mv /home/Z3/helburua /home/Z3/helburu_lortua
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
	
