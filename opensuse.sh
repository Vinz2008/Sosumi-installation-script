#!/bin/bash
 
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
echo "This is a script to help you to have a macos vm with sosumi"
echo "The script will now install snap. If you have already it,it will do nothing"
sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_15.2 snappy
sudo zypper dup --from snappy
sudo zypper install snapd

sudo systemctl enable --now snapd
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
 