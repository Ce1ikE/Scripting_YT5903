#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

set MAX
set min
echo "Enter 10 integers please:"
echo "Nr.1: "
read Number
MAX=$Number
min=$Number
for i in `seq 2 10`
do
	echo "Nr.$i: "
	read Number
	# Check max
	if [ $Number -gt $MAX ]
	then
		MAX=$Number;
	fi
	# Check min
	if [ $Number -lt $min ]
	then
		min=$Number;
	fi
done

echo -e "\n\nThe minimum number is:\e[32m$min\e[0m\nThe MAXIMUM number is:\e[32m$MAX\e[0m\n\n"

