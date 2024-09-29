
docker run -h altxormapa --rm -it --storage-opt size=1G --cpus=0.25 --memory=200m \
       	--user root ginkana bash -c "bash /root/monitor_keys.bash && exec gosu $USER bash"
