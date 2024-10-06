PARENT_DIR="/home/irakurri"            # Parent directory to watch
TARGET_DIR="sarraila"                  # Directory that the student will create
KEY_FILE="giltz_gorri_txikia"          # The file to watch for inside TARGET_DIR
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		files=($(ls -A $PARENT_DIR/$TARGET_DIR))
		if [[ ${#files[@]} -eq 1 ]]; then
			tput civis
			old_stty=$(stty -g < /dev/tty)
			stty -F /dev/tty -isig -icanon -ixoff -echo min 0 time 0
			tput clear
			printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
				"oh ene heroi ausarta, heroien artetik" \
				"bihotzez jakin dut, lehen ikusi nizunetik" \
				"adimenean lehiatu dezakezula sortzailearekin" \
				"labirinto hau menperatuko duzu, erraz errazik" \
				"erabiltzailea: eskuliburu" \
				"pasahitza: osoa" > /home/irakurri/sarraila/haria
			cat /home/irakurri/sarraila/haria
			stty -F /dev/tty "$old_stty"
			tput civis
			read -n1 < /dev/tty
			tput cnorm
			users_in_group=$(getent group labirinto_gela | awk -F: '{print $4}')
			if [[ -n "$users_in_group" ]]; then
				IFS=',' read -ra users <<< "$users_in_group"
				for user in "${users[@]}"; do
					pkill -SIGUSR1 -u "$user" bash
				done
			fi
			exit 0
		fi
	fi
	sleep 0.2
done

