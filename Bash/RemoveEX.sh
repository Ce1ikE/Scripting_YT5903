#!/bin/bash

echo "Verwijder oef van:"
read From
echo "Tot:"
read To

for i in `seq $From $To`
do

	rm Oef$i.sh
done


