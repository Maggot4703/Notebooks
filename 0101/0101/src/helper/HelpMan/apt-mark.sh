#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apt-mark.txt
which apt-mark >>./HelpMan/apt-mark.txt
whatis apt-mark >>./HelpMan/apt-mark.txt
apt-mark --help >>./HelpMan/apt-mark.txt
man apt-mark >>./HelpMan/apt-mark.txt
