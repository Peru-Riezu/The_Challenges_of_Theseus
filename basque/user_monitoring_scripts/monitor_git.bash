PARENT_DIR="/home/git"
TARGET_DIR="sarrailagile"
KEY_FILE="aldaketa_fitxategia"
REPO_PATH=/home/git/repo
COMMIT_HASH=$(git -C "$REPO_PATH" log --grep="^prest!!$" --pretty=format:"%H" -1)
EXPECTED_CONTENT=$(git -C "$REPO_PATH" show "$COMMIT_HASH":giltza)
ORIGINAL_CONTENT=$(cat "$REPO_PATH/giltza")

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		cat <<< "$ORIGINAL_CONTENT" > /tmp/jatorrizko_giltza
		patch /tmp/jatorrizko_giltza $PARENT_DIR/$TARGET_DIR/$KEY_FILE
		FILE_CONTENT=$(cat "/tmp/jatorrizko_giltza")
		rm /tmp/jatorrizko_giltza
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			cat /root/basque/user_monitoring_scripts/git_handle_success.bash > /handle_sigint.bash
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
