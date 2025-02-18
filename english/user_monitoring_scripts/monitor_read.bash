source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/read"
TARGET_DIR="sarraila"
KEY_FILE="small_red_key"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		files=($(ls -A $PARENT_DIR/$TARGET_DIR))
		if [[ ${#files[@]} -eq 1 ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/read_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
