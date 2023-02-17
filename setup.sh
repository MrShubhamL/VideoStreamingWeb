#!/bin/bash
#############################
# Author: Shubham Lohar
# Email: shubhamlohar952@gmail.com
##############################
if [[ $UID -ne 0 ]]
then
    echo "You are not root user!"
    exit 1
fi

# apt-get update -y
echo
echo " ------------------------ DATABASE CONFIGURATION ------------------------"
DB_USER="employee"
DB_PASS="employee"
DB_DATABASE="employee"
DB_HOST="localhost"

mysql -u root -proot <<EOF
CREATE USER '${DB_USER}'@'${DB_HOST}' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'${DB_HOST}';
FLUSH PRIVILEGES;
EOF

if [[ $? -ne 0 ]]
then
    echo -e "\033[0;31m ACTION: Database user '${DB_USER}' is already existed or MySQL Server is not running! \033[0m"
    exit 1
else
    echo -e "\033[0;32m Database user '${DB_USER}' is 'Successfully' created. \033[0m"
fi

mysql -u ${DB_USER} -p${DB_PASS} <<EOF
DROP DATABASE ${DB_DATABASE};
CREATE DATABASE ${DB_DATABASE};
USE ${DB_DATABASE};
CREATE TABLE emp_details (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,empName VARCHAR(55) NOT NULL, empEmail VARCHAR(200) UNIQUE NOT NULL, empContact VARCHAR(10) NOT NULL UNIQUE, empDepartment VARCHAR(100), password VARCHAR(200));
EOF

if [[ $? -ne 0 ]]
then
    echo -e "\033[0;31m Database ${DB_DATABASE} is 'Unsuccessfully' create! \033[0m"
    exit 1
else
    echo -e "\033[0;32m Database '${DB_DATABASE}' is 'Successfully' created. \033[0m"
fi


function installPackage() {
    packageName=${1}
    apt-get install -y ${packageName}
    if [[ $? -ne 0 ]]
    then
        echo "${packageName} is not installed!"
        exit 1
    fi
}
function mavenBuild() {
    mavenCMD=${1}
    mvn ${mavenCMD}
    if [[ $? -ne 0 ]]
    then
        echo "${mavenCMD} is not successfully!"
        exit 1
    fi
}
function downloadPackage() {
    packageURL=${1}
    wget ${packageURL}
    if [[ $? -ne 0 ]]
    then
        echo "Package not downloaded!"
        exit 1
    else
        tar -xzvf apache-tomcat-9.0.71.tar.gz
        if [[ -d /opt/tomcat9 ]]
        then
            echo -e "\033[0;31m Directory is already present, directory is removing.. \033[0m"
            set -x # debuging mode on
            rm -rf /opt/tomcat9
            mkdir /opt/tomcat9
            mv apache-tomcat-9.0.71/* /opt/tomcat9/
            rm -rf apache-tomcat-9.0.71.tar.gz
            set +x # debusing mode off
        else
            echo -e "\033[0;32m Directory is creating... \033[0m"
            set -x
            mkdir /opt/tomcat9
            mv apache-tomcat-9.0.71/* /opt/tomcat9/
            rm -rf apache-tomcat-9.0.71.tar.gz
            set +x
        fi
    fi
}

installPackage "maven"
mavenBuild "test"
mavenBuild "clean install"
downloadPackage "https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz"
mv target/EmployeeManagement-0.0.1-SNAPSHOT.war /opt/tomcat9/webapps/EmployeeManagement.war
/opt/tomcat9/bin/startup.sh
echo "----------------------------------------------------------------------------------------------"
echo -e "\033[0;32m open this url in browser http://192.168.29.158:8080/EmployeeManagement \033[0m"
echo "----------------------------------------------------------------------------------------------"
