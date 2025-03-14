source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/Bombe"
TARGET_DIR="lock"
KEY_FILE="key.pem"
TARGET_DIR2="box_of_secrets"
KEY_FILE2="encrypted_message.bin"
EXPECTED_CONTENT=$(cat /home/Bombe/original_message )

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" && -f "$PARENT_DIR/$TARGET_DIR2/$KEY_FILE2" ]]; then
		FILE_CONTENT=$(openssl pkeyutl -decrypt -inkey $PARENT_DIR/$TARGET_DIR/$KEY_FILE -in $PARENT_DIR/$TARGET_DIR2/$KEY_FILE2 2> /dev/null)
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/Bombe_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
