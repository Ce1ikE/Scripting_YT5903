#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

# Schrijf een script dat:
# a. Vraagt aan de gebruiker of hij een user wil toevoegen of verwijderen
# b. Indien hij een user wil verwijderen vraag je de naam en ga je deze user verwijderen indien deze bestaat
# Als je een user wil toevoegen vraag je een username en wachtwoord en voeg je deze user toe.


echo -e "\n\nDo you want to delete(d) or add(a) a user? :"
read Choice



case "$Choice" in
	a) 
		echo -e "\n\nEnter the name of the user: "
		read Username
		sudo useradd $Username
		sudo passwd $Username
		echo -e "\n\n\t\e[32mUser $Username created\e[m\n\n"
	;;
	d)
		echo -e "\n\nWhat is the name of the user you wish to delete? :"
		read Username
		# Check if the passwd file of the user exists
		if [ ! -f $(grep $Username /etc/passwd) ] # If it exists execute this statement
		then
			sudo userdel $Username
			echo -e "\n\n\t\e[32mUser $Username deleted\e[m\n\n"
		else # If it does not exist execute this statement
			echo -e "\n\n\t\e[31mUser $Username does not exist\e[m\n\n"
		fi
	;;
	*)
		echo -e "\n\n\t\e[31mNot a valid choice\e[m\n\n"
	;;
esac
