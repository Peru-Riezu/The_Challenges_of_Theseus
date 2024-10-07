PARENT_DIR="/home/labirintoaren_erdigunea"                  # Parent directory to watch
TARGET_DIR="sarraila"                                       # Directory that the student will create
KEY_FILE="giltza"                                           # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$(find . -size +0 | grep "giltza" | sort | xargs cat)
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

trap '' SIGUSR1
trap '' SIGUSR2

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			stty -F /dev/tty igncr -isig -icanon -ixoff -echo
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
			stty -F /dev/tty sane &> /dev/null
			read -n1
			pkill -SIGUSR1 bash
			exit 0
		fi
	fi
	sleep 0.2
done
