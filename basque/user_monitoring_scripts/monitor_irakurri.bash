PARENT_DIR="/home/irakurri"            # Parent directory to watch
TARGET_DIR="sarraila"                  # Directory that the student will create
KEY_FILE="giltz_gorri_txikia"          # The file to watch for inside TARGET_DIR
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

trap '' SIGUSR1

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		files=($(ls -A $PARENT_DIR/$TARGET_DIR))
		if [[ ${#files[@]} -eq 1 ]]; then
			stty -F /dev/tty igncr -isig -icanon -ixoff -echo
			tput civis > /dev/tty
			tput clear > /dev/tty
			printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
				"oh ene heroi ausarta, heroien artetik" \
				"bihotzez jakin dut, lehen ikusi nizunetik" \
				"adimenean lehiatu dezakezula sortzailearekin" \
				"labirinto hau menperatuko duzu, erraz errazik" \
				"erabiltzailea: eskuliburu" \
				"pasahitza: osoa" > /home/irakurri/sarraila/haria
			cat /home/irakurri/sarraila/haria
			stty -F /dev/tty sane
			read -n1
			pkill -SIGUSR1 bash
			tput cnorm > /dev/tty
			exit 0
		fi
	fi
	sleep 0.2
done

