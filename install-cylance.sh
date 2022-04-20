#!/bin/bash
# Install Cylance pre-req packages
sudo apt-get update -y && sudo apt-get install libxml2-utils make gcc bzip2 linux-headers-generic -y
# Create config file
sudo mkdir /opt/cylance/
sudo touch /opt/cylance/config_defaults.txt
sudo echo InstallToken=jgQnIw9fl88XMTjLPOM9ebsb > /opt/cylance/config_defaults.txt
sudo echo SelfProtectionLevel=2 >> /opt/cylance/config_defaults.txt
sudo echo LogLevel=2 >> /opt/cylance/config_defaults.txt
sudo echo VenueZone=WorkCloud >> /opt/cylance/config_defaults.txt
sudo echo UiMode=2 >> /opt/cylance/config_defaults.txt
# Install Cylance
sudo dpkg -i /tmp/cylance-protect.1404.x86_64.deb
# start Cylance service
echo "Checking Cylance Status --> $(service cylancesvc status)"
# Remove Cylance Installer
#sudo rm -rf /tmp/cylance-protect.1404.x86_64.deb
# END
