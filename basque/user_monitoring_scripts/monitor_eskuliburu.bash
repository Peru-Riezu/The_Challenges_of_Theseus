source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/eskuliburu"
TARGET_DIR="sarraila"
KEY_FILE="giltza"
EXPECTED_CONTENT=$(find $PARENT_DIR/zaborra -size +0 | grep "giltz" | sort | xargs cat 2> /dev/null)

trap '' SIGINT


while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/basque/user_monitoring_scripts/eskuliburu_handle_success.bash > /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
