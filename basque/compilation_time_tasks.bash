tar -xzf /home/eskuliburu/zaborra.tar.gz -C /home/eskuliburu/
rm -f /home/eskuliburu/zaborra.tar.gz
chown -R eskuliburu /home/eskuliburu/zaborra

tar -xf /home/git/repo.tar -C /home/git/
rm -f /home/git/repo.tar
chown -R git /home/git/repo

git config --global --add safe.directory /home/git/repo
