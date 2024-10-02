PARENT_DIR="/home/labirintoaren_erdigunea"            # Parent directory to watch
TARGET_DIR="sarraila"                 # Directory that the student will create
KEY_FILE="giltza"                     # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$(cat /home/labirintoaren_erdigunea/*)     # Replace with the expected content
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

while true; do
	if [[ -d "$PARENT_DIR/$TARGET_DIR" ]]; then
		if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
			FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
			if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
				stty sane
				sleep 0.1
				tput clear
				stty sane
				sleep 0.1
				printf "\n\n\n\n\n\n\n\n\n\n\n\n%s\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s" \
					"Azmakizun hau gainditu duzu" \
					"hurrengo erronkara nahi baldinba duzu jarraitu" \
					"erabiltzailea: irakurri" \
					"eta" \
					"pasahitza: beti" \
					"erabili beharko dituzu" | tee /home/labirintoaren_erdigunea/sarraila/haria
				printf "\n\n\n\n\n\n\n\n\n\n\n\n"
				read -n1
				stty sane
				sleep 0.1
				tput clear
				stty sane
				sleep 0.1
				exit 0
			fi
		fi
	fi
	sleep 0.2
done

