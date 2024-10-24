FROM debian:latest

RUN	apt update && apt upgrade -y
RUN	apt install sudo neofetch tree git vim nano man less emacs gosu procps ne ed jed gnupg wget iputils* -y
RUN	apt clean -y

RUN	mkdir /user_shell_files/
RUN	chmod 777 /user_shell_files/
RUN	touch /user_shell_files/lock
RUN	chmod 777 /user_shell_files/lock
RUN	echo "" >> /handle_sigint.bash
RUN	chmod 644 /handle_sigint.bash
RUN	echo "trap 'source /handle_sigint.bash' SIGINT" >> /etc/bash.bashrc
RUN	echo "shopt -s extglob" >> /etc/bash.bashrc

RUN echo "*               hard    nofile          50" >> /etc/security/limits.conf

COPY	basque/create_users.bash /root/basque/create_users.bash
COPY	basque/compilation_time_tasks.bash /root/basque/compilation_time_tasks.bash
COPY	create_all_users.bash /root/create_all_users.bash
RUN		bash /root/create_all_users.bash

COPY	basque/home/ /home/

RUN		for dir in /home/*; do sudo chown -R $(basename $dir):$(basename $dir) $dir; done
RUN		yes root | passwd # backdor for debugin

COPY	basque/user_monitoring_scripts/ /root/basque/user_monitoring_scripts/
COPY	basque/launch_monitors.bash /root/basque/launch_monitors.bash
COPY	basque/update_hosts.bash /root/basque/update_hosts.bash

COPY	launch_all_monitors.bash /root/launch_all_monitors.bash
COPY	launch_all_compilation_time_tasks.bash /root/launch_all_compilation_time_tasks.bash
COPY	update_all_hosts.bash /root/update_all_hosts.bash

RUN		bash /root/launch_all_compilation_time_tasks.bash
