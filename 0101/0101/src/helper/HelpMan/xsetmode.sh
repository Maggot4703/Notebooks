#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xsetmode.txt
which xsetmode >>./HelpMan/xsetmode.txt
whatis xsetmode >>./HelpMan/xsetmode.txt
xsetmode --help >>./HelpMan/xsetmode.txt
man xsetmode >>./HelpMan/xsetmode.txt
