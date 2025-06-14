#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

# Schrijf een script dat je aanroept met 2 parameters:
# een min en een max waarde.
# Vervolgens genereert je script 
# een random getal tussen deze 2 waarden. ($RANDOM) 

echo "Enter upper boundary:"
read MAX
echo "Lower boundary:"
read min
echo "How much random numbers do you need? :"
read RandNumbers
echo "-----------------------"
for i in `seq 0 $RandNumbers` 
do
	echo "$(($RANDOM%($MAX - $min)+ $min))"
done

echo "-----------------------"
echo "===== END ============="
echo "-----------------------"
