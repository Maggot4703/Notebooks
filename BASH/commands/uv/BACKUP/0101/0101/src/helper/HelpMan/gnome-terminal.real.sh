#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-terminal.real.txt
which gnome-terminal.real >>./HelpMan/gnome-terminal.real.txt
whatis gnome-terminal.real >>./HelpMan/gnome-terminal.real.txt
gnome-terminal.real --help >>./HelpMan/gnome-terminal.real.txt
man gnome-terminal.real >>./HelpMan/gnome-terminal.real.txt
