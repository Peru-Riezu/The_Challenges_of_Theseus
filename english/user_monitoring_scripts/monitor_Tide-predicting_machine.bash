source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/Tide-predicting_machine"
TARGET_DIR="submission_box"
KEY_FILE="2_1337_f0r_y0u"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		get_root_lock
		cat /root/common_functions/handle_success.bash > /handle_sigint.bash
		cat /root/user_monitoring_scripts/Tide-predicting_machine_handle_success.bash >> /handle_sigint.bash
		handle_succes_and_release_lock
		if [[ -f "/user_shell_files/Tide-predicting_machine_success" ]]; then
			rm /user_shell_files/Tide-predicting_machine_success
			exit 0
		fi
	fi
	sleep 0.2
done
