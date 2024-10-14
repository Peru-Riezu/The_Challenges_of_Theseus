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
	printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"ene seme maitea, maitatu baldinba dezaket nik" \
		"hartu hegal hauek eta etorri nirekin;" \
		"baino ez zaitez hurbildu eguzkira gehiegi" \
		"ez baduzu nahi zerutik erortzen hil" \
		"erabiltzailea: madarikatua" \
		"pasahitza: gogoko_ditut_eskuliburuak" > /home/git/ate_irekia/haria
	cat /home/git/ate_irekia/haria
	stty -igncr
	read -s -r -n1
	stty sane
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
	
