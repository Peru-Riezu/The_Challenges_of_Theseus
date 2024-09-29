FROM debian:latest

RUN		apt update && apt upgrade && apt install sudo vim nano man gosu -y
RUN		apt clean -y
COPY	basque/create_users.bash /root/basque/create_users.bash
COPY	create_all_users.bash /root/create_all_users.bash
RUN		bash /root/create_all_users.bash
COPY	*/users_homes/* /home/
COPY	basque/launch_monitors.bash /root/basque/launch_monitors.bash
COPY	launch_all_monitors.bash /root/launch_all_monitors.bash
