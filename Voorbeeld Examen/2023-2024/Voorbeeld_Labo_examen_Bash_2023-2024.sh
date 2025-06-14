#!/bin/bash 
#==================================================== 
while getopts :f:aAmh Option 
do 
	case $Option in 
	f) FileName=$OPTARG ;;  
	a) Action="AddLine" ;; # (1) 
	A) Action="AddFile";;  # (2) 
	m) Action="FindMin" ;; # (3) 
	h)  echo -e "\n\t Following options are available:  \n" 
		echo -e "\t -f >: The filename from which you wish to read" 
		echo -e "\t -a >: This option enables you to add up all numbers line by line" 
		echo -e "\t -A >: This option enables you to add all numbers from the file " 
		echo -e "\t -m >: This option enables you to find the minimum number from the file" 
		echo -e "\t -h >: Displays this menu \n\n" 
		exit 128 
	;; 
	*)	echo -e "\e[31m\n\t Unvalid option chosen \n\n" 
		exit 128 
	;; 
	esac 
done 
 
 
if [ -f "$FileName" ] 
then 
#==================================================== 
		# Add all numbers from each line  
		if [ "$Action" == "AddLine" ] # (1) 
		then 
				Line_Counter=1 

				for Lines in $(cat "$FileName") 
				do 
					Sum=0 
					IFS=$',' 
					for Columns in $Lines 
					do 
						Sum=$(($Sum + $Columns)) 
					done 
					IFS=$'\n' 
					Line_Counter=$(($Line_Counter + 1)) 
					echo -e "\e[32m\n\t Line $Line_Counter => Sum = $Sum" 
				done 
		fi 
#====================================================		 
		# Add all numbers from the whole file 
		if [ "$Action" == "AddFile" ] # (2) 
		then 
				Sum=0 

				for Lines in $(cat "$FileName") 
				do 
					IFS=$',' 
					for Columns in $Lines 
					do 
						Sum=$(($Sum + $Columns)) 
					done 
					IFS=$'\n'   
				done

				echo -e "\e[32m\n\t Total sum = $Sum" 
		fi 
#====================================================		 
		# Find the minimum value from the file 
		if [ "$Action" == "FindMin" ] # (3) 
		then			 
				min="" 
				for Lines in $(cat "$FileName") 
				do	 
					IFS=$',' 
					for Columns in $Lines 
					do 
						if [ "$min" == "" ] # This will only be executed once 
						then 
							min=$Columns 
						else 
							if [ "$min" -gt "$Columns" ] 
							then 
								min=$Columns	 
							fi 
						fi			 
					done 
					IFS=$'\n' 
				done 
				 
				echo -e "\e[32m\n\t Minimum value = $min" 
		fi 
#==================================================== 
else 
		echo -e "\e[31mFile: $FileName does not exist" 
fi 
 
echo -e "\n\n" 
