#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apt-get.txt
which apt-get >>./HelpMan/apt-get.txt
whatis apt-get >>./HelpMan/apt-get.txt
apt-get --help >>./HelpMan/apt-get.txt
man apt-get >>./HelpMan/apt-get.txt
