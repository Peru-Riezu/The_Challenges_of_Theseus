source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/Z3"
TARGET_DIR="lock"
KEY_FILE="key"
echo Z > /tmp/Z3_content
echo Z >> /tmp/Z3_content
echo -n Z >> /tmp/Z3_content

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		if cmp -s "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" /tmp/Z3_content; then
			rm /tmp/Z3_content
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/Z3_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
