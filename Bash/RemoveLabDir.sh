#!/bin/bash

echo "Delete Lab directories from:"
read From
echo "To:"
read To

for i in `seq $From $To`
do
	rm Labo$i -r -i
done
