#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)


# Schrijf een script dat je aanroept met een getal als parameter.
# Dit script controleert of er één parameter is 
# meegegeven en vervolgens de vermenigvuldigingstabel voor dit getal
# afdrukt zodat je volgende 
# output krijgt:

# 1 x 7 = 7
# 2 x 7 = 14
# …
# 20 x 7 = 140

echo "Enter the multiplication table:"
read multiTABLE
echo "Enter the max multiplier:"
read Max

for i in `seq 0 $Max`
do
	echo " $i x $multiTABLE = $(($i*$multiTABLE))"
done

echo "-----------"
echo "=== END ==="
echo "-----------"

