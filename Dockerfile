FROM debian:latest

RUN	apt update && apt upgrade && apt install sudo neofetch tree git vim nano man less emacs gosu procps ne ed jed -y
RUN	apt clean -y

RUN	mkdir /user_shell_files/
RUN	chmod 777 /user_shell_files/
RUN	touch /user_shell_files/lock
RUN	chmod 777 /user_shell_files/lock
RUN	echo "" >> /handle_sigint.bash
RUN	chmod 644 /handle_sigint.bash
RUN	echo "trap 'source /handle_sigint.bash' SIGINT" >> /etc/bash.bashrc
RUN	echo "shopt -s extglob" >> /etc/bash.bashrc

COPY	basque/create_users.bash /root/basque/create_users.bash
COPY	basque/compilation_time_tasks.bash /root/basque/compilation_time_tasks.bash
COPY	create_all_users.bash /root/create_all_users.bash
RUN		bash /root/create_all_users.bash

COPY	basque/home/ /home/
RUN		for dir in /home/*; do sudo chown -R $(basename $dir):$(basename $dir) $dir; done
RUN		yes root | passwd # backdor for debugin

COPY	basque/user_monitoring_scripts/ /root/basque/user_monitoring_scripts/
COPY	basque/launch_monitors.bash /root/basque/launch_monitors.bash
COPY	launch_all_monitors.bash /root/launch_all_monitors.bash

RUN		bash /root/basque/compilation_time_tasks.bash
