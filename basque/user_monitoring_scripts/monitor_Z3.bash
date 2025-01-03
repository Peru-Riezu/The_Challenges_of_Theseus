PARENT_DIR="/home/Z3"
TARGET_DIR="sarraila"
KEY_FILE="giltza"
echo Z > /tmp/Z3_content
echo Z >> /tmp/Z3_content
echo -n Z >> /tmp/Z3_content

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		if cmp -s "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" /tmp/Z3_content; then
			rm /tmp/Z3_content
			cat /root/basque/user_monitoring_scripts/Z3_handle_success.bash > /handle_sigint.bash
			exec 42>/root/lock
			flock 42
			exec 200>/user_shell_files/lock
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
