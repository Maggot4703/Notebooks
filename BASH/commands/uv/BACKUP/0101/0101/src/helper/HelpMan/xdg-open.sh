#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xdg-open.txt
which xdg-open >>./HelpMan/xdg-open.txt
whatis xdg-open >>./HelpMan/xdg-open.txt
xdg-open --help >>./HelpMan/xdg-open.txt
man xdg-open >>./HelpMan/xdg-open.txt
