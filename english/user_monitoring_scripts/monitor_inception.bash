source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/inception"
TARGET_DIR="lock"
KEY_FILE="key"
EXPECTED_CONTENT=$(echo "($(ls $PARENT_DIR/bone/ | tr -d '\n' | wc -c) + $(ls $PARENT_DIR/bone/ | wc -l)) /  2009" \
	| bc )

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/inception_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
