#!/bin/bash
<<comment
author:chandan
version:v1
function:create a multiple user at a time
comment

read -p "enter user name which you want to create......" user
for user in $user
do
	useradd -m $user
	echo "new $user is created successfully"
done
