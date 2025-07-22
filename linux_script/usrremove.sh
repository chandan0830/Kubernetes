#!/bin/bash
read -p "provide user name which you want to delete......... " user
for user in $user
do 	
	userdel $user
	echo " $user removed successfully"
done
