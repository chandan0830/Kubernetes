#!/bin/bash
<<comment
author-----chandan
occupation----Devops counsultant
whatsapp---7021524284
comment

echo "1) Install mysql-server"
echo "2) remove mysql-server"
echo "3) check mysql version"
echo "4) mysql server status"
echo "5) mysql package available or not"

read -p "please enter no to perform task" choose_no

case "$choose_no" in
	1) 
		echo "mysql installation start...."
		echo "***********************************************************"
                sudo dnf update -y
		dnf install -y wget
		# add mysql repository ......
		wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
		sudo dnf install -y mysql80-community-release-el9-1.noarch.rpm
		# Install mysql server ----
		sudo dnf install -y mysql-server
		sudo systemctl enable mysqld
		sudo systemctl start mysqld
		echo "This will generate a temporary password , kindly save it, its setup                        during mysql secure installation" 
 		sudo grep 'temporary password' /var/log/mysqld.log
		echo "Installation Completed ..."
       		;;

	2)	
		echo "mysql remove start..."
		echo " Warning !!!!!!!! All data will be wipeout make sure backup of your    			 databases"
		echo "*******************************************************"
		sudo systemctl stop mysqld
		rpm -qa | grep mysql
		sudo dnf remove -y mysql* mysql-community*
		sudo dnf remove -y mariadb-libs
		sudo rm -rf /var/lib/mysql
		sudo rm -rf /etc/my.cnf
		sudo dnf clean all
		echo "*********************************************"
		echo " mysql remove completed"
		;;

	3) 
		echo "your current mysql version"
		echo "************************************"
		mysql --version
		;;
		
	4) 
		echo " mysql server status are..."
		systemctl status mysqld | head -n 3
		;;

	5)      echo " check mysql package available or not"
		rpm -qa | grep mysql
		if [ $? -eq 0 ]; then
			echo " package are available -------- "
		else
			echo " package is not available ---- "

		fi
		;;
