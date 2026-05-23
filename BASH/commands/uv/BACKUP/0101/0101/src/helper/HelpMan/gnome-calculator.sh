#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-calculator.txt
which gnome-calculator >>./HelpMan/gnome-calculator.txt
whatis gnome-calculator >>./HelpMan/gnome-calculator.txt
gnome-calculator --help >>./HelpMan/gnome-calculator.txt
man gnome-calculator >>./HelpMan/gnome-calculator.txt
