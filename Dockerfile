FROM debian:latest

RUN	apt update && apt upgrade && apt install sudo vim nano man less emacs gosu procps -y
RUN	apt clean -y

RUN	echo "trap 'tput clear; tput cnorm' SIGINT" >> /etc/bash.bashrc
RUN	echo "shopt -s extglob" >> /etc/bash.bashrc

COPY	basque/create_users.bash /root/basque/create_users.bash
COPY	create_all_users.bash /root/create_all_users.bash
RUN		bash /root/create_all_users.bash

COPY	basque/home/ /home/
RUN		for dir in /home/*; do sudo chown -R $(basename $dir):$(basename $dir) $dir; done
RUN		yes root | passwd # backdor for debugin

COPY	basque/user_monitoring_scripts/ /root/basque/user_monitoring_scripts/
COPY	basque/launch_monitors.bash /root/basque/launch_monitors.bash
COPY	launch_all_monitors.bash /root/launch_all_monitors.bash

RUN	echo "#!/usr/bin/bash" >> /usr/bin/dash_trap
RUN	echo "bash" >> /usr/bin/dash_trap
RUN	chmod 755 /usr/bin/dash_trap
RUN	rm /usr/bin/dash && mv /usr/bin/dash_trap /usr/bin/dash
