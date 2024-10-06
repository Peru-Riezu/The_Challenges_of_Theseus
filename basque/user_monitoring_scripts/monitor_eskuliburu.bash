PARENT_DIR="/home/labirintoaren_erdigunea"                  # Parent directory to watch
TARGET_DIR="sarraila"                                       # Directory that the student will create
KEY_FILE="giltza"                                           # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$("find . -size +0 | grep "giltza" | sort | xargs cat")
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			old_stty=$(stty -F /dev/tty -g)
			stty -F /dev/tty -isig -icanon -ixoff -echo min 0 time 0
			tput civis > /dev/tty
			tput clear > /dev/tty
			printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
				"ene seme maitea, maitatu baldinba dezaket nik" \
				"hartu hegal hauek eta etorri nirekin;" \
				"baino ez zaitez hurbildu eguzkira gehiegi" \
				"ez baduzu nahi zerutik erortzen hil" \
				"erabiltzailea: madarikatua" \
				"pasahitza: gogoko_ditut_eskuliburuak" > /home/eskuliburu/sarraila/haria
			cat /home/eskuliburu/sarraila/haria
			stty -F /dev/tty "$old_stty"
			tput civis > /dev/tty
			read -n1
			tput cnorm
			users_in_group=$(getent group labirinto_gela | awk -F: '{print $4}')
			IFS=',' read -ra users <<< "$users_in_group"
			for user in "${users[@]}"; do
				pkill -SIGUSR1 -u "$user" bash
			done
			exit 0
		fi
	fi
	sleep 0.2
done
