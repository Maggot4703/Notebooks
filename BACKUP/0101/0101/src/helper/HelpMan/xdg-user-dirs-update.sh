#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xdg-user-dirs-update.txt
which xdg-user-dirs-update >>./HelpMan/xdg-user-dirs-update.txt
whatis xdg-user-dirs-update >>./HelpMan/xdg-user-dirs-update.txt
xdg-user-dirs-update --help >>./HelpMan/xdg-user-dirs-update.txt
man xdg-user-dirs-update >>./HelpMan/xdg-user-dirs-update.txt
