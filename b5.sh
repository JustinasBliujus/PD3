#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Naudojimas: $0 <failo_vardas_arba_direktorijos_vardas>"
    exit 1
fi

# ar argumentas yra failo vardas
if [ -f "$1" ]; then
    echo "$1 yra failo vardas."
    exit 0
fi

# ar argumentas yra direktorijos vardas
if [ -d "$1" ]; then
    echo "$1 yra direktorijos vardas."
    exit 0
fi

# kažkas kita
echo "$1 nėra nei failo, nei direktorijos vardas."

