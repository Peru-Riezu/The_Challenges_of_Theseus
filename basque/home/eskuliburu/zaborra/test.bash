num_files=12000
output_dir="./random_files"
mkdir -p "$output_dir"
random_index_1=$((RANDOM % num_files + 1))
random_index_2=$((RANDOM % num_files + 1))

for i in $(seq 1 $num_files);
do
	filename=$(tr -dc 'a-z' </dev/urandom | head -c 200)

	touch "$output_dir/$filename"

	if [ $i -eq $random_index_1 ]; then
		printf "%s\n%s\n%s\n%s\n%s\n\n"
			"ene labirinto ederra"
			"zu ihesten ia egin naiz hil"
			"ziur nago eperrak beste"
			"inork ezin duela"
			"atera zure barrutik" > $output_dir/$filename
	fi

	if [ $i -eq $random_index_1 ]; then
		printf "%s\n%s\n%s\n%s\n%s\n%s\n"
			"ez dago mundu onetan"\
			"ni baino adimentsuagorik" \
			"ez dago gizakien artean" \
			"aurreratu nazakeenik" \
			"ez Nilo baino ugalkorragoa" \
			"den emakume adimentsu baterik" > $output_dir/$filename
	fi


done
