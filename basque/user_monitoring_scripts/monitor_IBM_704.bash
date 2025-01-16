source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/IBM_704"
TARGET_DIR="aurkezpen_ontzia"
KEY_FILE="konponketa"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		get_root_lock
		cat /root/common_functions/handle_success.bash > /handle_sigint.bash
		cat /root/basque/user_monitoring_scripts/IBM_704_handle_success.bash >> /handle_sigint.bash
		handle_succes_and_release_lock
		if [[ -f "/user_shell_files/IBM_704_success" ]]; then
			rm /user_shell_files/IBM_704_success
			exit 0
		fi
	fi
	sleep 0.2
done
