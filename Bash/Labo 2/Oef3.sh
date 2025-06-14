#!/bin/bash

# | | | | ___| | | ___   \ \      / /__  _ __| | __| | |
# | |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |
# |  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|
# |_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)

function Add() {
	SUM=0
	for Arg in "$@"
	do
		if [[ "$Arg" =~ (\+|-)?[0-9]+$  ]] # Check if the argument is a integer
		then
			SUM=$(($SUM + ($Arg)))		
		fi
	done
	echo "$SUM"
}

function Multi() {
	SUM=1
	for Arg in "$@"
	do

		if [[ "$Arg" =~ (\+|-)?[0-9]+$  ]] # Check if the argument is a integer
		then
			SUM=$(($SUM * ($Arg)))		
		fi
	done
	echo "$SUM"
}

IFS=$';' # The numbers in the file are seperated by a semicolon 
SuppVar=0
FileCheck=0
# First we check the options given to the script
# A = Add
# M = Multiply
# F = File
while getopts :F:AM Choice
do
	case "$Choice" in
	A) echo -e "\n\tPerform addition" ;SuppVar=1
	;;
	M) echo -e "\n\tPerform multiplication" ;SuppVar=2
	;;
	F) echo -e "\n\tPerforming operation with file $OPTARG" ;FileCheck=1;FileName=$OPTARG	
	;;
	*) echo -e "\n\tNO VALID CHOICE : $Choice";;
	esac
done

# After we are finished checking all the options
# We apply them in a other case statement
# where this time we first check if the "F" option was given
# and afterwards we check the operator choice made by the user


case "$FileCheck" in
	1) # Perform operation with file
		case "$SuppVar" in
			1) # Addition
			Result=0
			for Number in $(cat "$FileName")
			do
				Result=$(($Result + $Number))	
			done
			;;

			2) # Multiplication
			Result=1
			for Number in $(cat "$FileName")
			do
				Result=$(($Result * $Number))	
			done
			;;
		esac
		;;
	0) # Perform operation without file
		case "$SuppVar" in
			1) Result="$(Add "$@")" ;;
			2) Result="$(Multi "$@")" ;;	
		esac
		;;
esac

echo -e "\n\n\tResult = $Result"


