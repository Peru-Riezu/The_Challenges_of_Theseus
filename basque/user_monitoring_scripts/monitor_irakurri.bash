PARENT_DIR="/home/irakurri"
TARGET_DIR="sarraila"
KEY_FILE="giltz_gorri_txikia"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		files=($(ls -A $PARENT_DIR/$TARGET_DIR))
		if [[ ${#files[@]} -eq 1 ]]; then
			cat /root/basque/user_monitoring_scripts/irakurri_handle_success.bash > /handle_sigint.bash
			exec 42>/root/lock
			flock 42
			exec 200>/user_shell_files/lock
			flock 200
			pkill -SIGINT bash
			while [ ! -f "/user_shell_files/shells_working" ]; do
				sleep 0.01
			done
			flock -u 200
			while [ -f "/user_shell_files/shells_working" ]; do
				sleep 0.1
			done
			echo "" > /handle_sigint.bash
			flock -u 42
			exit 0
		fi
	fi
	sleep 0.2
done
