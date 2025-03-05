source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/Harrison_s_Chronometer"
TARGET_DIR="lock"
KEY_FILE="~$^(|\  gala  \"'<>"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		get_root_lock
		cat /root/common_functions/handle_success.bash > /handle_sigint.bash
		cat /root/user_monitoring_scripts/Harrison_s_Chronometer_handle_success.bash >> /handle_sigint.bash
		handle_succes_and_release_lock
		exit 0
	fi
	sleep 0.2
done
