source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/Sir_Tim_Berners-Lee"
TARGET_DIR="lock"
KEY_FILE="key"
EXPECTED_CONTENT=$(mkdir /tmp/www-exercice; cd /tmp/www-exercice; wget http://port-of-athens.net/compressed.tar 2> /dev/null; tar -xf compressed.tar; cd uncompressed_directory; file * | grep "tar archive" | awk '{print $1}' | tr -d ':' | xargs tar -xf ; cat key; rm -r /tmp/www-exercice)

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/Sir_Tim_Berners-Lee_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
