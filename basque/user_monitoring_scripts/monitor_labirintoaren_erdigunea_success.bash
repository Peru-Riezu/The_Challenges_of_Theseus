COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

stty igncr -isig -icanon -ixoff -echo
tput clear
tput civis
printf "%s\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n$COLOR_GREEN%s$COLOR_RESET\n%s\n" \
	"Asmakizun hau gainditu duzu" \
	"hurrengo erronkara nahi baldinba duzu jarraitu" \
	"erabiltzailea: irakurri" \
	"eta" \
	"pasahitza: beti" \
	"erabili beharko dituzu" > /home/labirintoaren_erdigunea/sarraila/haria
cat /home/labirintoaren_erdigunea/sarraila/haria
stty sane
read -s password
tput cnorm
