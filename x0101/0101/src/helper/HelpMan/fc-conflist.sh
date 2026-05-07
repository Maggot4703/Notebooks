#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fc-conflist.txt
which fc-conflist >>./HelpMan/fc-conflist.txt
whatis fc-conflist >>./HelpMan/fc-conflist.txt
fc-conflist --help >>./HelpMan/fc-conflist.txt
man fc-conflist >>./HelpMan/fc-conflist.txt
