docker run -h The_Challenges_of_Theseus --rm -it --storage-opt size=1G --cpus=0.25 --memory=200m \
	--user root the_challenges_of_theseus_container bash -c \
	"bash /root/launch_all_monitors.bash && exec gosu $USER bash"
