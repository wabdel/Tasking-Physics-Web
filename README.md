# Tasking-Physics-Web
Application for radiation oncology physics management
1- Installation:

	A) Ubuntu 20.04
	Install mysqlserver:
		Step 1: Update the system
			sudo apt update
			sudo apt upgrade
		Step 2: Install MySQL
			sudo apt install mysql-server
		Step 3: Securing MySQL
			sudo mysql_secure_installation
			- create mysql root password
		Step 4: Check if MySQL Service Is Running
			sudo systemctl status mysql
			
	Create tasking-physics database
		Step 5: Log in to MySQL Server
			sudo mysql -u root -p
			- type root password
		Step 6: Copy the following lines at mysql command prompt
		------------- Start --------------
		DROP USER IF EXISTS 'physics_tasking_user'@'%';
		DROP DATABASE IF EXISTS physics_tasking;
		CREATE DATABASE physics_tasking;   
		CREATE USER 'physics_tasking_user'@'%' IDENTIFIED WITH mysql_native_password BY 'physics_tasking_user';
		GRANT ALL ON physics_tasking.* TO 'physics_tasking_user'@'%';
		DROP USER IF EXISTS 'physics_tasking_user'@'localhost';
		CREATE USER 'physics_tasking_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'physics_tasking_user';
		GRANT ALL ON physics_tasking.* TO 'physics_tasking_user'@'localhost';
		FLUSH PRIVILEGES;
		------------- End --------------
