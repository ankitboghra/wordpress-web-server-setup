#!/bin/bash
clear
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }
#----------------------------------------------------------
echo "[Phase 1] Verifying and installing nginx, mysql, php..."
declare -a checkList=(nano nginx mysql php)

echo "Updating apt-get..."
sudo apt-get update
echo "Update done apt-get"

for loopVar in "${checkList[@]}";do

  #if package name differs for apt-get installation
  installName=$loopVar
  #Exceptions
  if [ $installName = "mysql" ];then installName="mysql-server"; fi
  if [ $installName = "php" ];then installName="php-cli"; fi

  if [ "`which $loopVar`" = "" ];then
    echo "Missing $loopVar."
    echo -n "Installing $loopVar..."
    sudo apt-get install $installName
    echo "Done"
  else
    echo "Found $loopVar"
    echo -n "Upgrading $loopVar..."
    {
    "`sudo apt-get upgrade $installName`"
    } > /dev/null
    echo "Done"
  fi
done
#removing packages that are no longer required
sudo apt-get autoremove
echo "[Phase 1 End] Installed and updated nginx, mysql, php..."
#----------------------------------------------------------


