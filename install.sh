#!/bin/bash
sudo apt -y update
sudo apt install -y mysql-server maven git
echo "Lets configure the MySQL database. Press enter to continue."
read
sudo mysql_secure_installation
echo "Lets create a new MySQL user"
echo "Enter the username"
read user
echo "Enter the password"
read password
echo "CREATE USER '$user'@'localhost' IDENTIFIED BY '$password';" | sudo mysql
echo "GRANT ALL PRIVILEGES ON *.* TO '$user'@'localhost';" | sudo mysql
echo "CREATE DATABASE LibAccount;" | sudo mysql
mvn test
