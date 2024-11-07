SHELL = /bin/bash

all: 
	sudo sh -c "docker build -t the_challenges_of_theseus_container .; \
		bash ./create_all_users_local.bash; \
		service ssh restart; \
		service nginx restart; \
		bash ./concat_reroute_ips.bash > /root/reroute_all_ips.bash; \
		/root/reroute_all_ips.bash"

update:
	git pull

set_up:
	sudo sh -c "apt update; \
		sudo apt install xfsprogs -y; \
		fallocate -l 20G /var/lib/docker.img; \
		mkfs.xfs -m crc=1,finobt=1 /var/lib/docker.img; \
		mkdir -p /var/lib/docker; \
		mount -o loop,pquota /var/lib/docker.img /var/lib/docker; \
		grep -q '/var/lib/docker.img' /etc/fstab || \
			(echo '/var/lib/docker.img /var/lib/docker xfs loop,pquota 0 0' | tee -a /etc/fstab > /dev/null); \
		apt install docker* nginx ssh iptables -y; \
		rm /etc/ssh/sshd_config; \
		rm /etc/ssh/launch_container.bash; \
		rm /etc/nginx/nginx.conf; \
		rm -r /www-data; \
		ln -s $$(pwd)/sshd_files/sshd_config /etc/ssh/sshd_config; \
		ln -s $$(pwd)/reroute_all_ips.bash /etc/ssh/reroute_all_ips.bash; \
		ln -s $$(pwd)/sshd_files/launch_container.bash /etc/ssh/launch_container.bash; \
		ln -s $$(pwd)/nginx_files/nginx.conf /etc/nginx/nginx.conf; \
		ln -s $$(pwd)/nginx_files/www-data /www-data; \
		bash ./concat_reroute_ips.bash > /root/reroute_all_ips.bash; \
		chmod +x /root/reroute_all_ips.bash; \
		/root/reroute_all_ips.bash; \
		chmod o+x ..; \
		crontab -l 2>/dev/null | grep -Fq '@reboot sleep 2 && bash /root/reroute_all_ips.bash' || \
			((crontab -l 2>/dev/null; echo '@reboot sleep 2 && bash /root/reroute_all_ips.bash') \
				| crontab -)"

clean:
	-test -n "$$(docker ps -a -q)" && docker kill $$(docker ps -a -q)
	docker container prune -f
	docker image prune -af
	-test -n "$$(docker volume ls -q)" && docker volume rm $$(docker volume ls -q)
	docker network prune -f
	docker system prune -af
