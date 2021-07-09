#!/bin/bash
 
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
echo "This is a script to help you to have a macos vm with sosumi"
echo "The script will now install snap. If you have already it,it will do nothing"
sudo apt update
sudo apt install snapd
sudo snap install core
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
 