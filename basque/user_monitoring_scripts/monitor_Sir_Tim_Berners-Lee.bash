source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/Sir_Tim_Berners-Lee"
TARGET_DIR="sarraila"
KEY_FILE="giltza"
EXPECTED_CONTENT=$(mkdir /tmp/www-exercice; cd /tmp/www-exercice; wget http://atenaseko-portua.net/trinkotua.tar 2> /dev/null; tar -xf trinkotua.tar; cd direktorio_destrinkotua; file * | grep "tar archive" | awk '{print $1}' | tr -d ':' | xargs tar -xf ; cat giltza; rm -r /tmp/www-exercice)

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/basque/user_monitoring_scripts/Sir_Tim_Berners-Lee_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
