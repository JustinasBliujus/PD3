if [ $# -ne 1 ]; then
    echo "Naudojimas: $0 <naudotojo_vardas>"
    exit 1
fi

username="$1"
login_records=$(last "$username")

if echo "$login_records" | grep -q "still logged in"; then
    login_time=$(echo "$login_records" | grep "still logged in" | awk '{print $7}')
    current_time=$(date "+%s")
    login_time_seconds=$(date -d "$login_time" "+%s")
    duration=$((current_time - login_time_seconds))

    echo "Naudotojas $username dirba $((duration / 3600)) val., $(((duration % 3600) / 60)) min., ir $((duration % 60)) sek."
else
    echo "Naudotojas $username neprisijungęs prie sistemos."
fi

