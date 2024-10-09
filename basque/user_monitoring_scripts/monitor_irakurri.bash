PARENT_DIR="/home/irakurri"            # Parent directory to watch
TARGET_DIR="sarraila"                  # Directory that the student will create
KEY_FILE="giltz_gorri_txikia"          # The file to watch for inside TARGET_DIR
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		files=($(ls -A $PARENT_DIR/$TARGET_DIR))
		if [[ ${#files[@]} -eq 1 ]]; then
			stty -F /dev/tty igncr -isig -icanon -ixoff -echo &> /dev/null
			tput civis > /dev/tty
			tput clear > /dev/tty
			printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
				"oh ene heroi ausarta, heroien artetik" \
				"bihotzez jakin dut, lehen ikusi nizunetik" \
				"adimenean lehiatu dezakezula sortzailearekin" \
				"labirinto hau menperatuko duzu, erraz errazik" \
				"erabiltzailea: eskuliburu" \
				"pasahitza: osoa" > /home/irakurri/sarraila/haria
			cat /home/irakurri/sarraila/haria > /dev/tty
			stty -F /dev/tty -igncr &> /dev/null
			stty -F /dev/tty flush &> /dev/null
			while read -r -t 0 &> /dev/null; do : ; done
			sleep 0.5
			read -s -r -n1 < /dev/tty &> /dev/null
			stty -F /dev/tty sane &> /dev/null
			mv /home/irakurri/sarraila /home/irakurri/ate_irekia
			mv /home/irakurri/helburua /home/irakurri/helburu_lortua
			pkill -SIGINT bash
			exit 0
		fi
	fi
	sleep 0.2
done

