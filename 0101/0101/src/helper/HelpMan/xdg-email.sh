#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xdg-email.txt
which xdg-email >>./HelpMan/xdg-email.txt
whatis xdg-email >>./HelpMan/xdg-email.txt
xdg-email --help >>./HelpMan/xdg-email.txt
man xdg-email >>./HelpMan/xdg-email.txt
