get_root_lock()
{
	exec 42>/root/lock
	flock 42
}

handle_succes_and_release_lock()
{
	# Publish only after both parts of /handle_sigint.bash have been written.
	# A generation distinguishes retries of the same submitted-program test.
	local event_id="${BASHPID}:$((++SUCCESS_EVENT_SEQUENCE))"
	local finished_event
	rm -f /user_shell_files/success_finished
	printf '%s\n' "$event_id" > /user_shell_files/success_event
	# A persistent acknowledgement cannot be missed if a screen closes quickly.
	# It is written only after the shell can receive the next event's signal.
	while true; do
		finished_event=''
		if [[ -r /user_shell_files/success_finished ]]; then
			IFS= read -r finished_event < /user_shell_files/success_finished
		fi
		[[ $finished_event == "$event_id" ]] && break
		# A signal arriving while PROMPT_COMMAND is finishing may not restart
		# it. Retry until a shell has started the screen; do not interrupt it.
		if [[ ! -e /user_shell_files/shells_working ]]; then
			pkill -SIGINT bash
		fi
		sleep 0.1
	done
	rm -f /user_shell_files/success_event /user_shell_files/success_finished
	echo "" > /handle_sigint.bash
	flock -u 42
}

