#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xdg-user-dir.txt
which xdg-user-dir >>./HelpMan/xdg-user-dir.txt
whatis xdg-user-dir >>./HelpMan/xdg-user-dir.txt
xdg-user-dir --help >>./HelpMan/xdg-user-dir.txt
man xdg-user-dir >>./HelpMan/xdg-user-dir.txt
