if [ $# -ne 3 ]; then
    echo "Naudojimas: $0 <failo_vardas> <pradžios_eilutės_numeris> <pabaigos_eilutės_numeris>"
    exit 1
fi

file_name="$1"
start_line="$2"
end_line="$3"

if [ ! -f "$file_name" ]; then
    echo "Failas $file_name neegzistuoja."
    exit 1
fi

if [ "$start_line" -le 0 ]; then
    echo "Pradžios eilutės numeris turi būti didesnis už 0."
    exit 1
fi

if [ "$end_line" -le "$start_line" ]; then
    echo "Pabaigos eilutės numeris turi būti didesnis už pradžios eilutės numerį."
    exit 1
fi

sed -n "$start_line","$end_line"p "$file_name"

