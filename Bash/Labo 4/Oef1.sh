#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

# Write a "sed" command that removes all white lines
# from data1.txt and stores it as output

echo -e "\e[36m"
echo -e "\n======================================"
echo -e "           START OF PROGRAM           "
echo -e "======================================\n"
echo -e "\e[m"

echo -e "\n\nGive a name for the file where you want to write to: "
read Filename

if [ ! -f $Filename ] # Check destination if file exist (variable name)
then
	touch $Filename
	chmod 700 $Filename
fi

echo -e "\n\nGive the name of the data file which you want to read from: "
read SourceName
if [ -f $SourceName ] # Check if source file exist (Fixed name)
then
cat $SourceName | sed -e '/^$/d' > $Filename 
# Get the content from file "data1.txt and remove all empty lines"
# The remaing content is copied(> !!NOT APPENDED!!) to filename

echo "Output from file $Filename" 
echo -e "\e[32m"
cat $Filename # Show the output of the file 
echo -e "\e[m"
fi
echo -e "runtime: $SECONDS s\n"
echo -e "\e[36m"
echo -e "\n======================================"
echo -e "           END OF PROGRAM             "
echo -e "======================================\n"
echo -e "\e[m"
