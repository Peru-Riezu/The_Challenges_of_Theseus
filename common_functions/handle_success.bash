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

process_count_command()
{
	printf '%s\n' \
		'# this script counts the submitted script and the processes it spawns,' \
		'# to check whether it uses more processes than strictly necessary.'
	printf 'bash -s --'
	printf ' %q' "$@"
	printf " <<'PROCESS_COUNT_COMMAND'\n"
	cat <<'PROCESS_COUNT_COMMAND'
	set +m
	PROCESS_COUNT=0
	PROCESS_READY=0
	PROCESS_STATUS=0

	timeout --kill-after=1 5 "$@" > /dev/null 2>&1 &
	timeout_pid=$!
	deadline=$((SECONDS + 7))

	while (( SECONDS < deadline )); do
		snapshot=$(ps -eo pid=,ppid=,comm= 2>/dev/null) || break
		processes=()
		selected=()
		while read -r pid parent_pid command_name; do
			if [[ $pid == "$timeout_pid" ]]; then
				processes=("$pid")
				selected[$pid]=1
				break
			fi
		done <<< "$snapshot"

		PROCESS_COUNT=0
		sleep_found=0
		cat_found=0
		for ((i = 0; i < ${#processes[@]}; i++)); do
			while read -r pid parent_pid command_name; do
				[[ -z $pid || $parent_pid != "${processes[i]}" ]] && continue
				[[ ${selected[$pid]:-0} == 1 ]] && continue
				selected[$pid]=1
				processes+=("$pid")
				((++PROCESS_COUNT))
				[[ $command_name == sleep ]] && sleep_found=1
				[[ $command_name == cat ]] && cat_found=1
			done <<< "$snapshot"
		done

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
	if wait "$timeout_pid" 2>/dev/null; then
		PROCESS_STATUS=0
	else
		PROCESS_STATUS=$?
	fi
	printf "%s\n" "$PROCESS_COUNT"
	[[ $PROCESS_READY == 1 && $PROCESS_STATUS -eq 0 ]]
PROCESS_COUNT_COMMAND
	printf 'PROCESS_COUNT_COMMAND\n'
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

