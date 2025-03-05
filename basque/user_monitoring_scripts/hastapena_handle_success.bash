# de facto there is a sources handle_success.bash here

print_success_prose()
{
	printf "Teseo; ene heroia, ene maitea.\n"
	printf "\n"
	printf "Lortu duzu! Dedaloren labirintoa atzean utzi duzu, piztia makurra hilda dago,\n"
	printf "eta haur guztiak salbu daude. Igaro duzu bizitza galdu gabe, besteek,\n"
	printf "igarotzean, dena galdu zuten bidea, negar eta oihuz beteta zegoena. Orain,\n"
	printf "bakea eta zure ospea bakarrik dira geratzen.\n"
	printf "\n"
	printf "Eta orain, aurrez aurre gaude. Ni, haria eta ezpata eman dizuna, zure alde\n"
	printf "otoitz egiten egon naiz, zuk ikusi ez arren.\n"
	printf "\n"
	printf "Baina, ene Teseo, zein ankerra zaren!\n"
	printf "Eman dizudan guztiaren ondoren,\n"
	printf "lotxarik gabe nire bihotza lapurtzen.\n"
	printf "\n"
	printf "Oh, Teseo! guztiz naiz zurea.\n"
	printf "\n"
	printf "Baina ezin dugu hemen ospatu. Kreta ez da jada leku segurua, ez niretzat,\n"
	printf "ez nire arrebentzat. Minosen haserrea eguzkiarekin batera esnatuko da,\n"
	printf "eta ordurako, gu joanak izan behar gara.\n"
	printf "\n"
	printf "Eraman nazazu, Teseo. Eraman nire arreba ere. Eraman gaitzazu\n"
	printf "itsasoaren bestaldera, gure aitaren itzaletatik urrun.\n"
}

print_message()
{
	indent=$(( (COLUMNS - 80) / 2 ))
	prefix=''
	for ((i=1; i<=indent; i++)) ; do
	    prefix+=' '
	done
	printf "\n\n\n\n\n\n%s%s\n%s%s\n%s%s\n%s%s\n" \
		"$prefix" "Lortu duzu!!" \
		"$prefix" "Labirinto gela guztiak gainditu dituzu, horain gnu/linux-en oinarrizko" \
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

	print_success_prose >> /home/hastapena/sarraila/Ariadna
	mv /home/hastapena/sarraila /home/hastapena/ate_irekia
	mv /home/hastapena/helburua /home/hastapena/helburu_lortua
	cd
	tput clear
	tput clear
	tput cnorm
fi

yield_success_lock
