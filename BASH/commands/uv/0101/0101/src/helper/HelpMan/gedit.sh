#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gedit.txt
which gedit >>./HelpMan/gedit.txt
whatis gedit >>./HelpMan/gedit.txt
gedit --help >>./HelpMan/gedit.txt
man gedit >>./HelpMan/gedit.txt
