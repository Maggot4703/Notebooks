#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-terminal.txt
which gnome-terminal >>./HelpMan/gnome-terminal.txt
whatis gnome-terminal >>./HelpMan/gnome-terminal.txt
gnome-terminal --help >>./HelpMan/gnome-terminal.txt
man gnome-terminal >>./HelpMan/gnome-terminal.txt
