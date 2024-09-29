bash basque/create_users.bash

for user in $(awk -F':' '{ print $1 }' /etc/passwd); do sudo usermod -aG docker $user; done
