#!/bin/bash
read -p "enter name of package ........ " pkg
rpm -qa |grep $pkg 
if [ $? -eq 0 ]; then
	echo " *******************************"
	echo " $pkg software available in your system"
	
else
	echo "*********************************"
	echo " $pkg software not available in your system"
	
fi
