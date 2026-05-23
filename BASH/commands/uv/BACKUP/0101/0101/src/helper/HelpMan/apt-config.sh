#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apt-config.txt
which apt-config >>./HelpMan/apt-config.txt
whatis apt-config >>./HelpMan/apt-config.txt
apt-config --help >>./HelpMan/apt-config.txt
man apt-config >>./HelpMan/apt-config.txt
