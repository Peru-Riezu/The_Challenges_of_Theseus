tar -xzf /home/the/trash.tar.gz -C /home/the/
rm -f /home/the/trash.tar.gz
chown -R the /home/the/zaborra

tar -xf /home/git/repo.tar -C /home/git/
rm -f /home/git/repo.tar
chown -R git /home/git/repo

git config --global --add safe.directory /home/git/repo

tar -xzf /home/analytical_engine/sustraiak.tar.gz -C /home/analytical_engine/
rm -f /home/analytical_engine/sustraiak.tar.gz
chown -R analytical_engine /home/analytical_engine/sustraiak/

tar -xzf /home/inception/ezurra.tar.gz -C /home/inception/
rm -f /home/inception/ezurra.tar.gz
chown -R inception /home/inception/ezurra/
