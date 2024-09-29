useradd -m labirintoaren_erdigunea
echo 'labirintoaren_erdigunea:piraten_bizitza_oberena_da' | chpasswd
chsh -s labirintoaren_erdigunea /bin/bash 
