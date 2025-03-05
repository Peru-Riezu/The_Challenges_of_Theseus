# de facto there is a sources handle_success.bash here

print_success_prose()
{
	printf "Theseus, my hero, my love.\n"
	printf "\n"
	printf "You have done it! You have left behind Daedalus' labyrinth; the vile beast is\n"
	printf "dead, and all the children are safe.  You have walked without losing your life,\n"
	printf "a path where others lost everything, in a place once filled with cries and\n"
	printf "sorrow. Only peace and your legend remain.\n"
	printf "\n"
	printf "And now, we stand face to face.  I, the one who gave you the thread and the\n"
	printf "sword, have been praying for you all this time, even though you did not see me.\n"
	printf "\n"
	printf "But, oh, dear Theseus, how cruel you are!\n"
	printf "After all I have given you,\n"
	printf "without shame, you steal my heart.\n"
	printf "\n"
	printf "Oh, Theseus! I am completely yours.\n"
	printf "\n"
	printf "But we cannot celebrate here. Crete is no longer safe, neither for me nor for\n"
	printf "my sister. Minos' wrath will awaken with the sun, and by then, we must be gone.\n"
	printf "\n"
	printf "Take me, Theseus. Take my sister too. Take us across the sea, far, far away,\n"
	printf "until our father's shadow has faded away.\n"
}

print_message()
{
	indent=$(( (COLUMNS - 80) / 2 ))
	prefix=''
	for ((i=1; i<=indent; i++)) ; do
	    prefix+=' '
	done
	printf "\n\n\n\n\n\n%s%s\n%s%s\n%s%s\n%s%s\n" \
		"$prefix" "You did it!!" \
		"$prefix" "You have overcome all the chambers of the labyrinth; now you have the gist of"
		"$prefix" "the GNU/Linux CLI, and you are ready to face the world and turn yourself into a"
		"$prefix" "famous hero."
}

print_banner()
{
	indent=$(( (COLUMNS - 80) / 12 ))
	prefix=''
	for ((i=1; i<=indent; i++)) ; do
	    prefix+=' '
	done
	prefix+="VICTORY!!"
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

	print_success_prose >> /home/inception/sarraila/Ariadna
	mv /home/inception/sarraila /home/inception/ate_irekia
	mv /home/inception/helburua /home/inception/helburu_lortua
	cd
	tput clear
	tput clear
	tput cnorm
fi

yield_success_lock
