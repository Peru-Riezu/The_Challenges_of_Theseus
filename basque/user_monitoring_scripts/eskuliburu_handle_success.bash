# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"ene seme maitea, maitatu baldinba dezaket nik" \
		"hartu hegal hauek eta etorri nirekin;" \
		"baino ez zaitez hurbildu eguzkira gehiegi" \
		"ez baduzu nahi zerutik erortzen hil" \
		"erabiltzailea: madarikatua" \
		"pasahitza: gogoko_ditut_eskuliburuak" > /home/eskuliburu/sarraila/haria
	cat /home/eskuliburu/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/eskuliburu/sarraila /home/eskuliburu/ate_irekia
	mv /home/eskuliburu/helburua /home/eskuliburu/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
