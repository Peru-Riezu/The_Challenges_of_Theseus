tar -xzf /home/the/trash.tar.gz -C /home/the/
rm -f /home/the/trash.tar.gz
chown -R the /home/the/trash

tar -xf /home/git/repo.tar -C /home/git/
rm -f /home/git/repo.tar
chown -R git /home/git/repo

git config --global --add safe.directory /home/git/repo

tar -xzf /home/analytical_engine/roots.tar.gz -C /home/analytical_engine/
rm -f /home/analytical_engine/roots.tar.gz
chown -R analytical_engine /home/analytical_engine/roots/

tar -xzf /home/inception/bone.tar -C /home/inception/
rm -f /home/inception/bone.tar
chown -R inception /home/inception/bone/
