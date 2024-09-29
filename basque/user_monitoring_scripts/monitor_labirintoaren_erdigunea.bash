PARENT_DIR="/home/labirintoaren_erdigunea"            # Parent directory to watch
TARGET_DIR="sarraila"                 # Directory that the student will create
KEY_FILE="giltza"                     # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT="cat fitxategi barruan zaude
fitxategiak dira bost
bere barruak ikusteko
bost cat egitea
ez zen azkarrena izango


Cat egiten duzunean, > erabili, fitxategia sortzeko.
Bide ikusezin bat, helmugara iristeko.
Giltzak sortuko dituzu, altxorra aurkitzeko.


ginkana hasia da
eta zu zaude hemen
izango al zara zu
altxorretara lehen?


Giltza nahi baduzu,
Fitxategi guztiak batu.
'giltza' izena eman,
Eta sarrailan sartu segidan.

giltz bat sarrailik gabe
ez al du sorginak
'sarraila' sortzeko botere?


man man
man cat
man ls
man mkdir
cat *
cat < in > out
cat in > out
https://www.gnu.org/software/bash/manual/bash.html
https://www.gnu.org/software/bash/manual/bash.html#Redirections
https://www.gnu.org/software/bash/manual/bash.html#Pattern-Matching"     # Replace with the expected content

while true; do
  if [[ -d "$PARENT_DIR/$TARGET_DIR" ]]; then
    if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
      FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
      if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
	clear
        printf "\n\n\n\n\n\n\n\n\n\n\n\n\nCongratulations! You have solved the riddle.\n\n\n\n\n\n\n\n\n\n\n\n\n" | tee /home/ginkana/sarraila/hurrengo_urratsa
	read -n1
        exit 0
      fi
    fi
  fi
  sleep 0.2
done

