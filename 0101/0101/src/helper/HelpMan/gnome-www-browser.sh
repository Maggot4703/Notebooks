#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-www-browser.txt
which gnome-www-browser >>./HelpMan/gnome-www-browser.txt
whatis gnome-www-browser >>./HelpMan/gnome-www-browser.txt
gnome-www-browser --help >>./HelpMan/gnome-www-browser.txt
man gnome-www-browser >>./HelpMan/gnome-www-browser.txt
