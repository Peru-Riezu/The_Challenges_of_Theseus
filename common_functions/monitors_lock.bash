get_root_lock()
{
	exec 42>/root/lock
	flock 42
}

handle_succes_and_release_lock()
{
	pkill -SIGINT bash
	while [ ! -f "/user_shell_files/shells_working" ]; do
		sleep 0.01
	done
	while [ -f "/user_shell_files/shells_working" ]; do
		sleep 0.1
	done
	echo "" > /handle_sigint.bash
	flock -u 42
}

