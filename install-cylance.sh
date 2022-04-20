#!/bin/bash
# Install Cylance pre-req packages
sudo apt-get update -y && sudo apt-get install libxml2-utils make gcc bzip2 linux-headers-generic -y
# Create Cylance config file
sudo mkdir /opt/cylance/ -p
sudo touch /opt/cylance/config_defaults.txt
sudo echo InstallToken=XXXXXXXXXXXXXXXXXX > /opt/cylance/config_defaults.txt
sudo echo SelfProtectionLevel=2 >> /opt/cylance/config_defaults.txt
sudo echo LogLevel=2 >> /opt/cylance/config_defaults.txt
sudo echo VenueZone=WorkCloud >> /opt/cylance/config_defaults.txt
sudo echo UiMode=2 >> /opt/cylance/config_defaults.txt
# Install Cylance
sudo dpkg -i /tmp/cylance-protect.1404.x86_64.deb
# Check Cylance service after installed
echo "Checking Cylance Status --> $(status cylancesvc)"
# Manually Start Cylance
#start cylancesvc
# Uninstall Cylance
#dpkg -P cylance-protect
# Remove Cylance Installer
#sudo rm -rf /tmp/cylance-protect.1404.x86_64.deb
# END
