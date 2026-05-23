#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xedit.txt
which xedit >>./HelpMan/xedit.txt
whatis xedit >>./HelpMan/xedit.txt
xedit --help >>./HelpMan/xedit.txt
man xedit >>./HelpMan/xedit.txt
