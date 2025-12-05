FROM debian:latest

RUN	apt update \
	&& apt upgrade -y \
	&& apt install sudo fastfetch tree git vim nano groff man less emacs gosu procps ne ed jed gnupg wget iputils* file \
			 figlet cowsay bc -y \
	&& apt clean -y

ENV PATH=$PATH:/usr/games

RUN	mkdir /user_shell_files/
RUN	chmod 777 /user_shell_files/
RUN	touch /user_shell_files/lock
RUN	chmod 777 /user_shell_files/lock
RUN	echo "" >> /handle_sigint.bash
RUN	chmod 644 /handle_sigint.bash
RUN	echo "trap 'source /handle_sigint.bash' SIGINT" >> /etc/bash.bashrc
RUN	echo "shopt -s extglob" >> /etc/bash.bashrc

ARG LANG=basque

COPY	$LANG/create_users.bash /root/create_users.bash
COPY	$LANG/compilation_time_tasks.bash /root/compilation_time_tasks.bash
RUN		bash /root/create_users.bash

COPY	$LANG/home/ /home/

RUN		for dir in /home/*; do sudo chown -R $(basename $dir):$(basename $dir) $dir; done
RUN		yes root | passwd # backdor for debugin

COPY	$LANG/user_monitoring_scripts/ /root/user_monitoring_scripts/
COPY	$LANG/launch_monitors.bash /root/launch_monitors.bash
COPY	$LANG/update_hosts.bash /root/update_hosts.bash
COPY	common_functions /root/common_functions

RUN		bash /root/compilation_time_tasks.bash
