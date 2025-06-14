#!/bin/bash

echo "Oefening van:"
read From
echo "Oefening tot:"
read To
for i in `seq $From $To`
do

 touch Oef$i.sh
 chmod 700 Oef$i.sh
 echo "#!/bin/bash" > Oef$i.sh

done
