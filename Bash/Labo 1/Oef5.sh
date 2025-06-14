#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

# Check first if a argument is given to the script
# (Number of Arg == $# | All Arg content == $@ | selective Arg == $1 or $2 or ...)

if [ $# -eq 0 ]
then
	echo -e "\nEnter a backup directory name: "
	read BackupName
else
	# If the argument is given to the script we set the variable
	# "BackupName" equal to the first argument
	BackupName=$1
fi


echo -e "Which directory do you want to backup? :"
read SourceDIR

# Check if the directory "SourceDIR" exists otherwise print a message
if [ -d "$SourceDIR" ]
then
	BackupDIR="/tmp/$BackupName"
	mkdir "$BackupDIR" # Make the backup directory
	
	cp -r "$SourceDIR" "$BackupDIR" # Copy the contents from "SourceDIR" to "BackupDIR"
	
	# search for all the files in the backup directory and add ".backup"
	find "$BackupDIR" -type f -exec mv {} {}.backup \;


	# Print a message when the backup is completed
	# and show content of the backup directory
	echo -e "\e[32m\n\n\tBackup Completed\e[m\n"
	ls -R "$BackupDIR"
	echo -e "\n\n"
else # Print a message if the source directory is not present
	echo -e "\e[31m\n\n\tDirectory $SourceDIR does not exist\e[m\n\n"
fi
