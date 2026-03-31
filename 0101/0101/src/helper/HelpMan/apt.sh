#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apt.txt
which apt >>./HelpMan/apt.txt
whatis apt >>./HelpMan/apt.txt
apt --help >>./HelpMan/apt.txt
man apt >>./HelpMan/apt.txt
