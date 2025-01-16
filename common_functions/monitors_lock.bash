get_root_lock()
{
	exec 42>/root/lock
	flock 42
}

handle_succes_and_release_lock()
{
	for pid in $(pgrep bash); do
		prlimit --pid $pid --nofile=201:201
	done
	pkill -SIGINT bash
	while [ ! -f "/user_shell_files/shells_working" ]; do
		sleep 0.01
	done
	while [ -f "/user_shell_files/shells_working" ]; do
		sleep 0.1
	done
	for pid in $(pgrep bash); do
		prlimit --pid $pid --nofile=50:50
	done
	echo "" > /handle_sigint.bash
	flock -u 42
}

