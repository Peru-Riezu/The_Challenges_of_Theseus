PARENT_DIR="/home/irakurri"            # Parent directory to watch
TARGET_DIR="sarraila"                  # Directory that the student will create
KEY_FILE="giltz_gorri_txikia"          # The file to watch for inside TARGET_DIR
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		files=($(ls -A $PARENT_DIR/$TARGET_DIR))
		if [[ ${#files[@]} -eq 1 ]]; then
			tput clear
			tput civis
			printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n\n" \
				"oh ene heroi ausarta, heroien artetik" \
				"bihotzez jakin egin dut, lehen ikusi nizunetik" \
				"adimenean lehiatu zenezakezula sortzailearekin" \
				"laberinto hau memperatuko duzu, zure adimenarekin" \
				"erabiltzailea: irakurri" \
				"pasahitza: beti" > /home/irakurri/sarraila/haria
			cat /home/irakurri/sarraila/haria
			read -n1
			pkill -SIGUSR1 bash
			exit 0
		fi
	fi
	sleep 0.2
done

