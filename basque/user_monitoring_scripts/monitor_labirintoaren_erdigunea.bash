PARENT_DIR="/home/labirintoaren_erdigunea"                  # Parent directory to watch
TARGET_DIR="sarraila"                                       # Directory that the student will create
KEY_FILE="giltza"                                           # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$(cat /home/labirintoaren_erdigunea/*)     # Replace with the expected content
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			old_stty=$(stty -g < /dev/tty)
			stty -F /dev/tty -isig -icanon -ixoff -echo min 0 time 0
			tput clear
			tput civis
			printf "%s\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n" \
				"Asmakizun hau gainditu duzu" \
				"hurrengo erronkara nahi baldinba duzu jarraitu" \
				"erabiltzailea: irakurri" \
				"eta" \
				"pasahitza: beti" \
				"erabili beharko dituzu" > /home/labirintoaren_erdigunea/sarraila/haria
			cat /home/labirintoaren_erdigunea/sarraila/haria
			stty "$old_stty" < /dev/tty
			stty sane -F /dev/tty
			read -n1
			pkill -SIGUSR1 bash
			exit 0
		fi
	fi
	sleep 0.2
done

