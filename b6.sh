if [ $# -eq 0 ]; then
    echo "Nenurodyti jokie failų vardai."
    exit 1
fi

for filename in "$@"; do
    if [ -e "$filename" ]; then
        new_filename=$(echo "$filename" | tr '[:lower:]' '[:upper:]')
        if [ -e "$new_filename" ]; then
            echo "Failas $new_filename jau egzistuoja. Praleidžiame."
        else
            mv -i "$filename" "$new_filename"
            echo "Failas $filename pervadintas į $new_filename."
        fi
    else
        echo "Failas $filename neegzistuoja."
    fi
done

