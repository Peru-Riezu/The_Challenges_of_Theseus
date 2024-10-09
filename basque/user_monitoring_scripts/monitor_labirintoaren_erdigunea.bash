PARENT_DIR="/home/labirintoaren_erdigunea"                  # Parent directory to watch
TARGET_DIR="sarraila"                                       # Directory that the student will create
KEY_FILE="giltza"                                           # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$(cat /home/labirintoaren_erdigunea/*)     # Replace with the expected content
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			stty -F /dev/tty igncr -isig -icanon -ixoff -echo &> /dev/null
			tput civis > /dev/tty
			tput clear > /dev/tty
			printf "%s\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n" \
				"Asmakizun hau gainditu duzu" \
				"hurrengo erronkara nahi baldinba duzu jarraitu" \
				"erabiltzailea: irakurri" \
				"eta" \
				"pasahitza: beti" \
				"erabili beharko dituzu" > /home/labirintoaren_erdigunea/sarraila/haria
			cat /home/labirintoaren_erdigunea/sarraila/haria > /dev/tty
			stty -F /dev/tty -igncr &> /dev/null
			stty -F /dev/tty flush &> /dev/null
			while read -r -t 0; do read -r; done
			sleep 0.5
			read -s -r -n1 < /dev/tty &> /dev/null
			stty -F /dev/tty sane &> /dev/null
			mv /home/labirintoaren_erdigunea/sarraila /home/labirintoaren_erdigunea/ate_irekia
			mv /home/labirintoaren_erdigunea/helburua /home/labirintoaren_erdigunea/helburu_lortua
			pkill -SIGINT bash
			exit 0
		fi
	fi
	sleep 0.2
done

