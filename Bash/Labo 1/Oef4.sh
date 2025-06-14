#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

if [ ! -f Junk.txt ]
then
	# This file is created so you can delete it
	touch Junk.txt
	echo "This is just junk nothing else" > Junk.txt
fi

echo -e "\nwhich file do you wish to delete? : "
read NameFile

if [ -f $NameFile ]
then
	rm $NameFile -i
	echo -e "\n\n\e[32mThe File $NameFile is deleted.\e[0m\n\n"
else
	echo -e "\n\n\e[31mThe File $NameFile does not exist.\e[0m\n\n"
fi

