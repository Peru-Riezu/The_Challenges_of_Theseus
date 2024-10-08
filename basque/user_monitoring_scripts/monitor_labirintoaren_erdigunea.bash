PARENT_DIR="/home/labirintoaren_erdigunea"                  # Parent directory to watch
TARGET_DIR="sarraila"                                       # Directory that the student will create
KEY_FILE="giltza"                                           # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$(cat /home/labirintoaren_erdigunea/*)     # Replace with the expected content

trap '' SIGUSR1

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			rm -f /success_script.bash
			mv /root/basque/user_monitoring_scripts/monitor_labirintoaren_erdigunea_success.bash /success_script.bash
			chmod 4444 /success_script.bash
			pkill -SIGUSR1 bash
			pkill -SIGUSR1 bash
			exit 0
		fi
	fi
	sleep 0.2
done

