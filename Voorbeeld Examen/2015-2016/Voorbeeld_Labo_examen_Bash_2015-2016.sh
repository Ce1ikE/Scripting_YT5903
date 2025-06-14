#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)


# "set -x" acts like a debugger command which will
# show you each step that will be taken if enabled 
#set -x

while getopts :adD:u:f:h Opt
do
	case "$Opt" in
	
	# Because we cannot delete and add a user at the same time
	# We make sure that both actions are covered by the same
	# Variable "Actiontype" so that only 1 action can be executed
	# should we come across the options several times
	a) Actiontype="add";; 
	d) Actiontype="del";;
	D) Directory=$OPTARG;;
	u) Username=$OPTARG;;
	f) Filename=$OPTARG;;
	# Remember that the format inside the file 
	# is LOGIN;GROUP;HOMEDIR;PASSWORD
 
	h) # Shows a extended help message
	echo -e "\n\nWelcome to the help page.\nHere are all the options available:\n"
	echo -e "<a>  Option to add a user. This option must be used in conjunction with <u>"
	echo -e "<d>  Option to delete a user. This option must be used in conjunction with <u>"
	echo -e "<D>  Option to change the home directory of a user. This option must be used in conjunction with <u>"
	echo -e "<u>  The username to add/delete/change directory"
	echo -e "<f>  The filename of a file that contains users data in CSV format."
	echo -e "     following fields could be contained in the file: LOGIN;GROUP;HOMEDIR;PASSWORD"
 	echo -e "<h>  Displays this list."
	exit 1
	;;
	*) # Shows a short help message
	echo -e "Invalid option $Opt \nAvailable options: -a | -d | -D <string> | -u <string> | -f <string> | -h" 
	exit 1
	;;
	
	esac
done

# =======================================================================================================================
# =======================================================================================================================
# ========================================= 2nd Phase ===================================================================
# =======================================================================================================================

# Once we are done checking all the options we must execute the options accordingly
# Therefore we must check wich options are left empty



if [ "$Username" ] # If the "Username" isn't left empty
then
	if [ "$Actiontype" == "add" ] # (1) We can add a user
	then
		if [ -d "$Directory" ] # Test if the Directory path for the home directory is given otherwise the variable is replaced by a empty string
		then
			Directory="-d $Directory"
		else
			Directory=""
		fi
		
		echo -e "\n\t Add user $Username"
		echo -e "\t useradd $Directory $Username"

	elif [ "$Actiontype" == "del" ] # (2) We can delete a user
	then
		echo -e "\n\t Delete user $Username"
		echo -e "\t userdel $Username \n\n"

	else # (3) We do nothing => print error message

		echo -e "\n\t\e[31mERROR!! No Action type chosen\e[m\n"
		exit 1
	fi

elif [ -f "$Filename" ] # If the "Filename" isn't left empty and does exist
then
	IFS=$'\n'
	echo -e "\n\tFile $Filename used\n\n"

	# Remember that the format inside the file 
	# is LOGIN;GROUP;HOMEDIR;PASSWORD
	# Lets first capture the information from the file line by line
	for Lines in `cat $Filename`
	do
		LOGIN=""
		GROUP=""
		HOMEDIR=""
		PASSWORD=""
		IFS=$';'
		Count=0
		
		for El in $Lines
		do
			case $Count in
				0) LOGIN=$El;;
				1) GROUP=$El;;
				2) HOMEDIR=$El;;
				3) PASSWORD=$El;;
			esac
			Count=$(($Count + 1))
		done
		
	IFS=$'\n'
	
	if [ "$Actiontype" == "add" ] # (1) We can add a user
	then
		if [ "$PASSWORD" ] # Hash the password
		then
			PASSWORD=$(echo -n "$PASSWORD" | openssl passwd -6 -stdin)
			PASSWORD="-p $PASSWORD"
		else
			
			PASSWORD=$(echo -n "password" | openssl passwd -6 -stdin )
			PASSWORD="-p $PASSWORD"  
		fi

		if [ "$GROUP" ] # Add the group option accordingly
		then
			GROUP="-g $GROUP"
		fi

		if [ "$HOMEDIR" ] # Add the home directory accordingly
		then
			HOMEDIR="-d $HOMEDIR"
		else
			HOMEDIR="-m"
		fi

		if [ "$LOGIN" ] # In the end only add a user if the LOGIN field wasn't empty
		then
			echo -e "\n\n\t Add user $LOGIN"
			echo -e "\t useradd $PASSWORD $GROUP $HOMEDIR $LOGIN"
		else # If the LOGIN field was empty print a message
			echo -e "\n\tERROR Empty login field"
			exit 1
		fi
		
	
	elif [ "$Actiontype" == "del" ] # (2) We can delete a user
	then
		if [ "$LOGIN" ]
		then
			echo -e "\n\t Delete user $LOGIN"
			echo -e "\t userdel $LOGIN \n\n"
		else
			echo -e "\n\tERROR Empty login field"
			exit 1
		fi

	else # (3) We do nothing => print error message

		echo -e "\n\t\e[31mERROR!! No Action type chosen\e[m\n"
		exit 1
 	fi
	done


else # If no username or file name was passed along

	echo -e "\n\n\tNo action was taken"

fi



echo -e "\n\n\n\t\tEND OF SCRIPT\n\n"


