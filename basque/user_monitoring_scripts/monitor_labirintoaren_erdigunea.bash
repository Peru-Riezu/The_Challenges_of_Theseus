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
				tput clear > /dev/tty
				printf "%s\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n" \
					"Asmakizun hau gainditu duzu" \
					"hurrengo erronkara nahi baldinba duzu jarraitu" \
					"erabiltzailea: irakurri" \
					"eta" \
					"pasahitza: beti" \
					"erabili beharko dituzu" >> /home/labirintoaren_erdigunea/sarraila/haria
				cat /home/labirintoaren_erdigunea/sarraila/haria > /dev/tty
				tput civis > /dev/tty
				read -n1 < /dev/tty
				tput clear > /dev/tty
				printf "${debian_chroot:+($debian_chroot)}" > /dev/tty
				printf "\[\033[01;32m\]\u@ls_egin\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ " /dev/tty
				tput cnorm > /dev/tty
				exit 0
			fi
		fi
	fi
	sleep 0.2
done

