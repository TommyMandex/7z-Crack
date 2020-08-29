#! /bin/bash

figlet -t jamesm0rr1s 7zCrack

if [ $# -ne 2 ]; then echo "Usage: $0 file.7z wordlist"; exit 1; fi

cleanup () { echo -e "\n"; exit 0; }
trap cleanup SIGINT

while read password; do
	echo -en "\rTrying Password: $password%\033[0K"
	7z x -p$password $1 &>/dev/null
	if [ $? -eq 0 ]; then echo -e "\n\nPassword found: $password\n"; exit 0; fi
done < $2

echo -e "\n\nPassword not found.\n"