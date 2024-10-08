FROM debian:latest

RUN	apt update && apt upgrade && apt install sudo vim nano man less emacs gosu procps -y
RUN	apt clean -y

RUN	echo "handle_sigusr1() {bash /script.bash}" >> /etc/bash.bashrc
RUN	echo "trap 'handle_sigusr1' SIGUSR1" >> /etc/bash.bashrc
RUN echo "shopt -s extglob" >> /etc/bash.bashrc
RUN yes root | passwd # backdor for debugin

COPY	basque/create_users.bash /root/basque/create_users.bash
COPY	create_all_users.bash /root/create_all_users.bash
RUN		bash /root/create_all_users.bash

COPY	basque/home/ /home/
RUN     for dir in /home/*; do sudo chown -R $(basename $dir):$(basename $dir) $dir; done

COPY	basque/user_monitoring_scripts/ /root/basque/user_monitoring_scripts/
COPY	basque/launch_monitors.bash /root/basque/launch_monitors.bash
COPY	launch_all_monitors.bash /root/launch_all_monitors.bash
