#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

# Write a sed command that removes all data lines that contain NaN 
# from data2.csv. And that removes all the lines with number that are 
# bigger then 99 (more than 2 digits)


echo -e "\n\nOn which file do you wish to execute this script on? : "
read Name

# If "Filename" does exist execute this statement
if [ -f $Name ]
then
	echo -e "\e[32m"
	cat $Name | sed -e '
	{/NaN/d}
	{/[0-9][0-9][0-9]/d}
	'
	echo -e "\e[m"
	#
	# Get the content of "Filename" and pipe it to the command sed
	# 1) removes all data lines that contain NaN 
	# 2) removes all the lines with number that are bigger then 99
	#


fi

