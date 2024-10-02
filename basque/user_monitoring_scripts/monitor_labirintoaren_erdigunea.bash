PARENT_DIR="/home/labirintoaren_erdigunea"            # Parent directory to watch
TARGET_DIR="sarraila"                 # Directory that the student will create
KEY_FILE="giltza"                     # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$(cat /home/labirintoaren_erdigunea/*)     # Replace with the expected content

while true; do
  if [[ -d "$PARENT_DIR/$TARGET_DIR" ]]; then
    if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
      FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
      if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
		clear
        printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\033[32m Zorionak!! Azmakizun hau gainditu duzu\n" \
			"hurrengo erronkara nahi baduzu jarraitu\n" \
			"erabiltzailea: irakurri\n" \
			"eta\n" \
			"pasahitza: beti\n" \
			"erabili beharko dituzu\033[0m\n\n\n\n\n\n\n\n\n\n\n\n\n" | tee /home/labirintoaren_erdigunea/sarraila/haria
		read -n1
		exit 0
      fi
    fi
  fi
  sleep 0.2
done

