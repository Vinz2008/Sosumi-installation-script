#!/bin/bash
 
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
echo "This is a script to help you to have a macos vm with sosumi"
echo "The script will now install snap. If you have already it,it will do nothing"
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf upgrade
sudo yum install snapd
sudo systemctl enable --now snapd.socket
sudo snap install sosumi
sudo snap connect sosumi:kvm
sosumi
 
cd ~/snap/sosumi/common/
 
filename="launch"
read -p "-m 2G \: " search
read -p "-m 6G \: " replace
if [[ $search != "" && $replace != "" ]]; then
sed -i "s/$search/$replace/" $filename
fi
sosumi
