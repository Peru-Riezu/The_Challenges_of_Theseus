source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/Antiziterako_mekanismoa"
TARGET_DIR="aurkezpen_ontzia"
KEY_FILE="erantzuna"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		get_root_lock
		cat /root/common_functions/handle_success.bash > /handle_sigint.bash
		cat /root/user_monitoring_scripts/Antiziterako_mekanismoa_handle_success.bash >> /handle_sigint.bash
		handle_succes_and_release_lock
		if [[ -f "/user_shell_files/Antiziterako_mekanismoa_success" ]]; then
			rm /user_shell_files/Antiziterako_mekanismoa_success
			exit 0
		fi
	fi
	sleep 0.2
done
