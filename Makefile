all: 
	docker build -t the_challenges_of_theseus_container .

update:
	git pull

set_up:
	-rm /etc/ssh/sshd_config
	-rm /etc/ssh/launch_container.bash
	-ln -s $$(pwd)/sshd_files/sshd_config /etc/ssh/sshd_config
	-ln -s $$(pwd)/sshd_files/launch_container.bash /etc/ssh/launch_container.bash
	-service ssh restart 
	-apt install docker* -y

clean:
	-test -n "$$(docker ps -a -q)" && docker kill $$(docker ps -a -q)
	docker container prune -f
	docker image prune -af
	-test -n "$$(docker volume ls -q)" && docker volume rm $$(docker volume ls -q)
	docker network prune -f
	docker system prune -af
