if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory_name> <word>"
    exit 1
fi

directory="$1"
word="$2"

if [ ! -d "$directory" ]; then
    echo "Directory '$directory' does not exist."
    exit 1
fi

find "$directory" -type f -name "*$word*" -exec rm -f {} +

echo "All files containing the word '$word' in their names within the directory '$directory' have been deleted."

