#!/bin/bash

echo "Make Directory from"
read From
echo "To"
read To

for i in `seq $From $To`
do
	mkdir Labo$i
	cp MakeEX.sh Labo$i
done
