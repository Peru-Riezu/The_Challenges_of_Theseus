script_dir=$(dirname "$(readlink -f "$0")")
echo "$script_dir"

bash $script_dir/basque/reroute_ips.bash
