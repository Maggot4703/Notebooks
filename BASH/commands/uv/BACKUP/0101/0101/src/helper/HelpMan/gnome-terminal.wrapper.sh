#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-terminal.wrapper.txt
which gnome-terminal.wrapper >>./HelpMan/gnome-terminal.wrapper.txt
whatis gnome-terminal.wrapper >>./HelpMan/gnome-terminal.wrapper.txt
gnome-terminal.wrapper --help >>./HelpMan/gnome-terminal.wrapper.txt
man gnome-terminal.wrapper >>./HelpMan/gnome-terminal.wrapper.txt
