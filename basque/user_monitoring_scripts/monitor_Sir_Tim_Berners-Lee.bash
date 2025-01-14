PARENT_DIR="/home/Sir_Tim_Berners-Lee"
TARGET_DIR="sarraila"
KEY_FILE="giltza"
EXPECTED_CONTENT=$(mkdir /tmp/www-exercice; cd /tmp/www-exercice; wget http://atenaseko-portua.net/trinkotua.tar 2> /dev/null; tar -xf trinkotua.tar; cd direktorio_destrinkotua; file * | grep "tar archive" | awk '{print $1}' | tr -d ':' | xargs tar -xf ; cat giltza; rm -r /tmp/www-exercice)

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			exec 42>/root/lock
			flock 42
			exec 200>/user_shell_files/lock

			cat /root/basque/user_monitoring_scripts/Sir_Tim_Berners-Lee_handle_success.bash > /handle_sigint.bash

			flock 200
			pkill -SIGINT bash
			while [ ! -f "/user_shell_files/shells_working" ]; do
				sleep 0.01
			done
			flock -u 200
			while [ -f "/user_shell_files/shells_working" ]; do
				sleep 0.1
			done
			echo "" > /handle_sigint.bash
			flock -u 42
			exit 0
		fi
	fi
	sleep 0.2
done
