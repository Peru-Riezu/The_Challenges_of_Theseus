SHELL = /bin/bash

all: 
	sudo docker build -t the_challenges_of_theseus_container .
	sudo bash ./create_all_users_local.bash
	sudo service ssh restart 
	sudo service nginx restart
	sudo bash ./concat_reroute_ips.bash > /root/reroute_all_ips.bash
	sudo /root/reroute_all_ips.bash

update:
	git pull

set_up:
	sudo sh -c "apt update || true; \
		sudo apt install xfsprogs -y || true; \
		fallocate -l 20G /var/lib/docker.img || true; \
		mkfs.xfs -m crc=1,finobt=1 /var/lib/docker.img || true; \
		mkdir -p /var/lib/docker || true; \
		mount -o loop,pquota /var/lib/docker.img /var/lib/docker || true; \
		grep -q '/var/lib/docker.img' /etc/fstab || \
			(echo '/var/lib/docker.img /var/lib/docker xfs loop,pquota 0 0' | tee -a /etc/fstab > /dev/null) || true; \
		apt install docker* nginx ssh iptables -y || true; \
		rm /etc/ssh/sshd_config || true; \
		rm /etc/ssh/launch_container.bash || true; \
		rm /etc/nginx/nginx.conf || true; \
		rm -r /www-data || true; \
		ln -s $$(pwd)/sshd_files/sshd_config /etc/ssh/sshd_config || true; \
		ln -s $$(pwd)/reroute_all_ips.bash /etc/ssh/reroute_all_ips.bash || true; \
		ln -s $$(pwd)/sshd_files/launch_container.bash /etc/ssh/launch_container.bash || true; \
		ln -s $$(pwd)/nginx_files/nginx.conf /etc/nginx/nginx.conf || true; \
		ln -s $$(pwd)/nginx_files/www-data /www-data || true; \
		bash ./concat_reroute_ips.bash > /root/reroute_all_ips.bash || true; \
		chmod +x /root/reroute_all_ips.bash || true; \
		/root/reroute_all_ips.bash || true; \
		crontab -l 2>/dev/null | grep -Fq '@reboot sleep 2 && sudo bash /root/reroute_all_ips.bash' || \
			((crontab -l 2>/dev/null; echo '@reboot sleep 2 && sudo bash /root/reroute_all_ips.bash') \
				| crontab -)"

clean:
	-test -n "$$(docker ps -a -q)" && docker kill $$(docker ps -a -q)
	docker container prune -f
	docker image prune -af
	-test -n "$$(docker volume ls -q)" && docker volume rm $$(docker volume ls -q)
	docker network prune -f
	docker system prune -af
