# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Isiltasunean, botatzen dut begirada atzera," \
		"eta ikusten dut, lehoi-geruza hori." \
		"" \
		"Nire ausartasuna—" \
		"hori deitu badezakegu" \
		"egin nuen ergeltasun hori." \
		"" \
		"Baina oroitzen dudan bakoitzean, gogoratzen dut nik" \
		"gizon sendo irribarretsu hori..." \
		"" \
		"Eta orduan, behera bezala izatea erabaki nuen," \
		"duda bakar bat ere euki ezinik." \
		"erabiltzailea: IBM_704" \
		"pasahitza: GM-NAA_I/O" > /home/Sir_Tim_Berners-Lee/sarraila/haria
	cat /home/Sir_Tim_Berners-Lee/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Sir_Tim_Berners-Lee/sarraila /home/Sir_Tim_Berners-Lee/ate_irekia
	mv /home/Sir_Tim_Berners-Lee/helburua /home/Sir_Tim_Berners-Lee/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
