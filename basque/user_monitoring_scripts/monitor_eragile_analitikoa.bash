source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/eragile_analitikoa"
TARGET_DIR="sarraila"
KEY_FILE="giltza"
EXPECTED_OUTPUT=$(find /home/eragile_analitikoa/sustraiak -perm 777)

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		GOTTEN_CONTENT=$(stat -c '%N' $PARENT_DIR/$TARGET_DIR/$KEY_FILE | awk -F" -> " '{print $2}' | tr -d "'")
		if [[ "$GOTTEN_CONTENT" == "$EXPECTED_OUTPUT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/eragile_analitikoa_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
