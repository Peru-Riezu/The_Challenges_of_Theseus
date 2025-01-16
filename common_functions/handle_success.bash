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
	mv "$basename" "$target"
}

get_success_lock_might_exit()
{
	touch /user_shell_files/shells_working

	echo here 1
	exec 21>/user_shell_files/lock
	echo here 2
	flock 21
	echo here 3
	FILE="/user_shell_files/user_shell_count"
	if [ ! -f "$FILE" ]; then
		echo 0 > "$FILE"
	fi
	CURRENT_VALUE=$(cat "$FILE")
	NEW_VALUE=$((CURRENT_VALUE + 1))
	echo "$NEW_VALUE" > "$FILE"
	echo here 4
	flock -u 21
	echo here 5

	my_pgid=$(ps -o pgid= -p $$)
	fg_pgid=$(ps -o tpgid= -p $$)
	my_pgid=$(echo "$my_pgid" | tr -d '[:space:]')
	fg_pgid=$(echo "$fg_pgid" | tr -d '[:space:]')

	while [ "$my_pgid" -ne "$fg_pgid" ]; do
		if [ ! -f "/user_shell_files/foreground_activated" ]; then
			flock 21
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
			flock -u 21
			exit 0
		fi

		sleep 0.01

		my_pgid=$(ps -o pgid= -p $$)
		fg_pgid=$(ps -o tpgid= -p $$)
		my_pgid=$(echo "$my_pgid" | tr -d '[:space:]')
		fg_pgid=$(echo "$fg_pgid" | tr -d '[:space:]')
	done

	echo here 6
	flock 21
}	

yield_success_lock()
{
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
	flock -u 21
}

