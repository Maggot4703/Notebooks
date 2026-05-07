#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gnome-language-selector.txt
which gnome-language-selector >>./HelpMan/gnome-language-selector.txt
whatis gnome-language-selector >>./HelpMan/gnome-language-selector.txt
gnome-language-selector --help >>./HelpMan/gnome-language-selector.txt
man gnome-language-selector >>./HelpMan/gnome-language-selector.txt
