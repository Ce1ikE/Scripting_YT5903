#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

# Write a sed command that changes the output.txt you created.
# It should change the following things:
# - cat to dog for the first 5 lines.
# - lazy to active for all the lines
# - cat to horse from line 6 to the end of the file
# - insterts a line at the start of the file: “this is the start of the file”
# - adds a line to the end of the file: “this is the end of the file”

echo -e "\n\nOn which file do you wish to execute the following script? : "
read Name

# if "Filename" does exist execute this statement 
if [ -f $Name ]
then
	echo -e "\e[32m"
	cat $Name | sed -e '
	1,5{s/dog/cat/}
	{s/lazy/active/} 
	6,${s/dog/horse/}
	1{s/^/This is the start of the file\n/}
	${s/$/\nThis is the end of the file/}
	'
	echo -e "\e[m"
	# 
	# Get the content of "Filename" and pipe it to the command "sed"
	# 1) set "dog" to "cat" for the first 5 lines (1,5) 
	# 2) set "lazy" to "active" for all the lines (same as 1,$)
	# 3) set "dog" to "horse" from line 6 to the end of the file (6,$)
	# 4) insert a line at the start of the file: "this is the start of the file"
	# 5) add a line to the end of the file: "this is the end of the file"
	#

else

	echo -e "\n\n\t\e[31mNo file with name $Name\e[m"

fi

