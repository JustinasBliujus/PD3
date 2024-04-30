if [ $# -ne 1 ]; then
    echo "Naudojimas: $0 <failo_vardas>"
    exit 1
fi

file_name="$1"

if [ ! -f "$file_name" ]; then
    echo "Failas '$file_name' neegzistuoja."
    exit 1
fi

temp_file=$(mktemp)

sed 'N;s/\n/ /' "$file_name" > "$temp_file"

while read -r line; do
    line_length=${#line}
    echo "Eilutė: $line, Ilgis: $line_length"
done < "$temp_file"

rm "$temp_file"

