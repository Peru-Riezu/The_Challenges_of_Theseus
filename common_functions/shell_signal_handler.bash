THESEUS_NORMAL_CURSOR=$(tput cnorm 2>/dev/null)

theseus_handle_success()
{
	local command_status=$?
	local cursor_prompt='\['"$THESEUS_NORMAL_CURSOR"'\]'
	if [[ $PS1 != "$cursor_prompt"* ]]; then
		PS1="$cursor_prompt$PS1"
	fi

	local event_id='' finished_event=''
	{ event_id=$(< /user_shell_files/success_event); } 2>/dev/null || :
	{ finished_event=$(< /user_shell_files/success_finished); } 2>/dev/null || :
	if [[ -z $event_id || $event_id == "${THESEUS_LAST_SUCCESS_EVENT:-}" || $event_id == "$finished_event" ]]; then
		trap : SIGINT
		return "$command_status"
	fi
	trap '' SIGINT

	local my_pgid fg_pgid
	my_pgid=$(ps -o pgid= -p $$)
	fg_pgid=$(ps -o tpgid= -p $$)
	my_pgid=${my_pgid//[[:space:]]/}
	fg_pgid=${fg_pgid//[[:space:]]/}
	if [[ -z $my_pgid || $my_pgid != "$fg_pgid" || $fg_pgid == -1 ]]; then
		trap : SIGINT
		return "$command_status"
	fi

	local saved_terminal
	saved_terminal=$(stty -g < /dev/tty) || {
		trap : SIGINT
		return "$command_status"
	}
	local theseus_success_registered=0

	THESEUS_LAST_SUCCESS_EVENT=$event_id
	source /handle_sigint.bash < /dev/tty > /dev/tty

	if [[ $theseus_success_registered == 1 ]]; then
		yield_success_lock
	fi
	stty "$saved_terminal" < /dev/tty
	tput sgr0 > /dev/tty
	tput cnorm > /dev/tty

	trap : SIGINT
	printf '%s\n' "$event_id" > /user_shell_files/success_finished
	return "$command_status"
}

trap : SIGINT
if [[ " ${PROMPT_COMMAND[*]} " != *" theseus_handle_success "* ]]; then
	PROMPT_COMMAND+=(theseus_handle_success)
fi

