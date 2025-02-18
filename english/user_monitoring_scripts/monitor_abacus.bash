source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/abacus"
TARGET_DIR="sarraila"
KEY_FILE="giltza"
EXPECTED_CONTENT=$(groups Phaedra | tr ' ' '\n' | tail -n +3 | sort | tr '\n' ' ' | xargs echo)

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/abacus_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
