# de facto there is a sources handle_success.bash here

print_message()
{
	indent=$(( (COLUMNS - 80) / 2 ))
	prefix=''
	for ((i=1; i<=indent; i++)) ; do
	    prefix+=' '
	done
	printf "\n\n\n\n\n\n%s%s\n%s%s\n%s%s\n%s%s" \
		"$prefix" "lortu duzu!!" \
		"$prefix" "labirinto gela guztiak gainditu dituzu, horain gnu/linux-en oinarrizko" \
		"$prefix" "komandoak ezagutzen dituzu, prest zaude mundura ateratzeko, eta heroi ospetxu" \
		"$prefix" "bat bilakatzeko!!"
}

print_banner()
{
	indent=$(( (COLUMNS - 80) / 12 ))
	prefix=''
	for ((i=1; i<=indent; i++)) ; do
	    prefix+=' '
	done
	prefix+="GARAIPENA!!"
	clear ; figlet -t -f mono9 "$prefix"
}

get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated

	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear

	printf "[5m"
	printf "[105m"
	printf "[34m"

	print_banner

	printf "[25m"

	print_message

	( sleep 5 && clear ; print_banner ; print_message ) &
	PID=$!

	stty -igncr
	read -s -r -n1
	stty sane
	printf "[0m"

	kill -9 "$PID" &> /dev/null

	print_banner > /home/hastapena/sarraila/Ari
	print_message >> /home/hastapena/sarraila/Ari
	cat /home/labirintoaren_erdigunea/sarraila/haria
	mv /home/hastapena/sarraila /home/hastapena/ate_irekia
	mv /home/hastapena/helburua /home/hastapena/helburu_lortua
	cd
	tput clear
	tput clear
	tput cnorm
fi

yield_success_lock
