all: 
	docker build -t the_challenges_of_theseus_container .
	bash ./create_all_users_local.bash
	service ssh restart 

update:
	git pull

set_up:
	-apt install docker* -y
	-apt install nginx -y
	-apt install iptables-persistent
	-rm /etc/ssh/sshd_config
	-rm /etc/ssh/launch_container.bash
	-rm /etc/nginx/nginx.conf
	-rm -r /www-data
	-ln -s $$(pwd)/sshd_files/sshd_config /etc/ssh/sshd_config
	-ln -s $$(pwd)/reroute_all_ips.bash /etc/ssh/reroute_all_ips.bash
	-ln -s $$(pwd)/sshd_files/launch_container.bash /etc/ssh/launch_container.bash
	-ln -s $$(pwd)/nginx_files/nginx.conf /etc/nginx/nginx.conf
	-ln -s $$(pwd)/nginx_files/www-data /www-data
	-bash ./concat_reroute_ips.bash > /etc/rc.local
	-chmod +x /etc/rc.local
	-./etc/rc.local
	-service nginx restart

clean:
	-test -n "$$(docker ps -a -q)" && docker kill $$(docker ps -a -q)
	docker container prune -f
	docker image prune -af
	-test -n "$$(docker volume ls -q)" && docker volume rm $$(docker volume ls -q)
	docker network prune -f
	docker system prune -af
