#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/remmina-gnome.txt
which remmina-gnome >>./HelpMan/remmina-gnome.txt
whatis remmina-gnome >>./HelpMan/remmina-gnome.txt
remmina-gnome --help >>./HelpMan/remmina-gnome.txt
man remmina-gnome >>./HelpMan/remmina-gnome.txt
