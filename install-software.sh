# Script that installs necessary Robo-Dev software for Ubuntu/Debian

# Run as root else if !/usr/bin/env bash
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Keep Ubuntu or Debian up to date
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# Java:
sudo apt-get install -y default-jdk

# Gradle:
wget https://services.gradle.org/distributions/gradle-4.6-bin.zip
mkdir /opt/gradle
unzip -d /opt/gradle gradle-4.6-bin.zip

# Git:
sudo apt-get install git
