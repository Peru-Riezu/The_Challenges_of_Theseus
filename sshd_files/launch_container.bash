docker run -h The_Challenges_of_Theseus --rm -it --storage-opt size=1G --cpus=0.25 --memory=200m \
       	--user root The_Challenges_of_Theseus_container bash -c "bash /root/monitor_keys.bash && exec gosu $USER bash"
