# Sourced by /etc/bash.bashrc in every interactive challenge shell.
THESEUS_NORMAL_CURSOR=$(tput cnorm 2>/dev/null)

theseus_handle_success()
{
	local command_status=$?
	# Ctrl+C can redraw the prompt without running this hook again.
	# Keep the cursor visible whenever the prompt is printed.
	local cursor_prompt='\['"$THESEUS_NORMAL_CURSOR"'\]'
	if [[ $PS1 != "$cursor_prompt"* ]]; then
		PS1="$cursor_prompt$PS1"
	fi

	# Read event metadata without invoking another interactive read builtin.
	# The monitor may remove a completed event while an interrupt is arriving.
	local event_id='' finished_event=''
	{ event_id=$(< /user_shell_files/success_event); } 2>/dev/null || :
	{ finished_event=$(< /user_shell_files/success_finished); } 2>/dev/null || :
	if [[ -z $event_id || $event_id == "${THESEUS_LAST_SUCCESS_EVENT:-}" || $event_id == "$finished_event" ]]; then
		trap : SIGINT
		return "$command_status"
	fi
	THESEUS_LAST_SUCCESS_EVENT=$event_id

	# Nested shells receive the same broadcast. Only the foreground shell may
	# read keys or change the terminal; parents must not replay the event later.
	local my_pgid fg_pgid
	my_pgid=$(ps -o pgid= -p $$)
	fg_pgid=$(ps -o tpgid= -p $$)
	my_pgid=${my_pgid//[[:space:]]/}
	fg_pgid=${fg_pgid//[[:space:]]/}
	if [[ -z $my_pgid || $my_pgid != "$fg_pgid" || $fg_pgid == -1 ]]; then
		trap : SIGINT
		return "$command_status"
	fi

	# Run from PROMPT_COMMAND, outside Readline's SIGINT trap. Bash's read -n1
	# enables ISIG even after stty -isig, so ignore INT for the whole screen.
	# Keep the normal trap while checking for work so new events can wake Bash.
	trap '' SIGINT
	local saved_terminal
	saved_terminal=$(stty -g < /dev/tty) || {
		trap : SIGINT
		return "$command_status"
	}
	local theseus_success_registered=0

	# Source in this shell so the localized handler's `cd` still takes effect.
	# A localized failure handler's `return` comes back here for cleanup.
	source /handle_sigint.bash < /dev/tty > /dev/tty

	if [[ $theseus_success_registered == 1 ]]; then
		yield_success_lock
	fi
	stty "$saved_terminal" < /dev/tty
	tput sgr0 > /dev/tty
	tput cnorm > /dev/tty

	# Ignore duplicate signals for this ID, but accept the next event before
	# acknowledging completion and allowing another monitor to publish it.
	trap : SIGINT
	printf '%s\n' "$event_id" > /user_shell_files/success_finished
	return "$command_status"
}

# SIGINT wakes an idle prompt; the hook displays the screen before Readline
# starts again. Reading keys inside the signal trap itself can corrupt its input.
trap : SIGINT
if [[ " ${PROMPT_COMMAND[*]} " != *" theseus_handle_success "* ]]; then
	PROMPT_COMMAND+=(theseus_handle_success)
fi

