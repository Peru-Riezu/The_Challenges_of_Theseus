COLOR_GREEN="\033[32m"
COLOR_RED="\033[31m"
COLOR_RESET="\033[0m"

animate_dots()
{
	while true; do
		for dots in '   ' '.  ' '.. ' '...'; do
			echo -ne "\b\b\b$dots"
			sleep 0.5
		done
	done
}

move_to_suffix()
{
	local basename="$1"
	local suffix="$2"
	local target="${basename}${suffix}"
	local n=1

	while [[ -e "$target" ]]; do
		target="${basename}${suffix}(${n})"
		((n++))
	done
	mv "$basename" "$target" && MOVED_FILE=$target
}

measure_process_count()
{
	local -
	set +m
	local timeout_pid deadline snapshot pid parent_pid command_name sleep_found cat_found
	PROCESS_COUNT=0
	PROCESS_LIST=''
	PROCESS_READY=0
	PROCESS_STATUS=0

	timeout --kill-after=1 5 "$@" > "${PROCESS_OUTPUT:-/user_shell_files/output}" 2>&1 &
	timeout_pid=$!
	deadline=$((SECONDS + 7))

	while (( SECONDS < deadline )); do
		snapshot=$(ps -eo pid=,ppid=,comm=) || break
		PROCESS_LIST=$(awk -v root="$timeout_pid" '
			{
				parent[$1] = $2
				order[NR] = $1
				line[$1] = $0
			}
			END {
				if (!(root in parent)) exit
				selected[root] = 1
				do {
					changed = 0
					for (pid in parent) {
						if (!(pid in selected) && (parent[pid] in selected)) {
							selected[pid] = 1
							changed = 1
						}
					}
				} while (changed)
				for (i = 1; i <= NR; i++) {
					if (order[i] != root && (order[i] in selected)) print line[order[i]]
				}
			}
		' <<< "$snapshot")

		PROCESS_COUNT=0
		sleep_found=0
		cat_found=0
		while read -r pid parent_pid command_name; do
			[[ -z $pid ]] && continue
			((++PROCESS_COUNT))
			[[ $command_name == sleep ]] && sleep_found=1
			[[ $command_name == cat ]] && cat_found=1
		done <<< "$PROCESS_LIST"

		if [[ $sleep_found == 1 && $cat_found == 1 ]]; then
			PROCESS_READY=1
			break
		fi
		kill -0 "$timeout_pid" 2>/dev/null || break
		sleep 0.1
	done

	if [[ $PROCESS_READY != 1 ]]; then
		kill -TERM "$timeout_pid" 2>/dev/null || :
	fi
	if wait "$timeout_pid"; then
		PROCESS_STATUS=0
	else
		PROCESS_STATUS=$?
	fi
}

get_success_lock_might_return()
{
	touch /user_shell_files/shells_working

	exec 200>/user_shell_files/lock
	flock 200
	FILE="/user_shell_files/user_shell_count"
	if [ ! -f "$FILE" ]; then
		echo 0 > "$FILE"
	fi
	CURRENT_VALUE=$(cat "$FILE")
	NEW_VALUE=$((CURRENT_VALUE + 1))
	echo "$NEW_VALUE" > "$FILE"
	theseus_success_registered=1
	flock -u 200

	my_pgid=$(ps -o pgid= -p $$)
	fg_pgid=$(ps -o tpgid= -p $$)
	my_pgid=$(echo "$my_pgid" | tr -d '[:space:]')
	fg_pgid=$(echo "$fg_pgid" | tr -d '[:space:]')

	while [ "$my_pgid" -ne "$fg_pgid" ]; do
		if [ ! -f "/user_shell_files/foreground_activated" ]; then
			flock 200
			FILE="/user_shell_files/user_shell_count"
			CURRENT_VALUE=$(cat "$FILE")
			if [ "$CURRENT_VALUE" -eq 1 ]; then
				rm /user_shell_files/foreground_activated
				rm /user_shell_files/shells_working
				rm "$FILE"
			else
				NEW_VALUE=$((CURRENT_VALUE - 1))
				echo "$NEW_VALUE" > "$FILE"
			fi
			flock -u 200
			return 0
		fi

		sleep 0.01

		my_pgid=$(ps -o pgid= -p $$)
		fg_pgid=$(ps -o tpgid= -p $$)
		my_pgid=$(echo "$my_pgid" | tr -d '[:space:]')
		fg_pgid=$(echo "$fg_pgid" | tr -d '[:space:]')
	done

	flock 200
}	

yield_success_lock()
{
	if [[ ${theseus_success_registered:-0} != 1 ]]; then
		return 0
	fi
	theseus_success_registered=0
	FILE="/user_shell_files/user_shell_count"
	CURRENT_VALUE=$(cat "$FILE")
	if [ "$CURRENT_VALUE" -eq 1 ]; then
		rm /user_shell_files/foreground_activated
		rm /user_shell_files/shells_working
		rm "$FILE"
	else
		NEW_VALUE=$((CURRENT_VALUE - 1))
		echo "$NEW_VALUE" > "$FILE"
	fi
	flock -u 200
	exec 200>&-
}

