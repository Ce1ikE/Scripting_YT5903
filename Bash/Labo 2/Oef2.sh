#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

Choice=1

while [ $Choice != 5 ];
do
	echo "Want do you want to do" 
	echo -e "1) Addition\n2) Substraction\n3) Multiplication\n4) Division\n5) Close"
read Choice
if [ $Choice != 5 ]
then
	echo "Enter number 1:"
	read N1
	echo "Enter number 2:"
	read N2
fi
case $Choice in

	1)
		echo "$N1 + $N2 = $(($N1+$N2))"
	  ;;
	2)
		echo "$N1 - $N2 = $(($N1 - $N2))"
	  ;;
	3)
		echo "$N1 * $N2 = $(($N1 * $N2))"
	  ;;
  	4)	echo "$N1 / $N2 = $(($N1 / $N2))"

	  ;;
	5)	echo "----- GoodBye -----"

	  ;;
	*)
		echo "NOT A VALID CHOICE"
	  ;;

esac
done
