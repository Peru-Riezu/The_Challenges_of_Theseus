tar -xzf /home/eskuliburu/zaborra.tar.gz -C /home/eskuliburu/
rm -f /home/eskuliburu/zaborra.tar.gz
chown -R eskuliburu /home/eskuliburu/zaborra

tar -xf /home/git/repo.tar -C /home/git/
rm -f /home/git/repo.tar
chown -R git /home/git/repo

git config --global --add safe.directory /home/git/repo

tar -xzf /home/eragile_analitikoa/sustraiak.tar.gz -C /home/eragile_analitikoa/
rm -f /home/eragile_analitikoa/sustraiak.tar.gz
chown -R eragile_analitikoa /home/eragile_analitikoa/sustraiak/

tar -xzf /home/hastapena/ezurra.tar.gz -C /home/hastapena/
rm -f /home/hastapena/ezurra.tar.gz
chown -R hastapena /home/hastapena/ezurra/
