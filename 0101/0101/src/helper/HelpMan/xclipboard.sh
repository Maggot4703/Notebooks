#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xclipboard.txt
which xclipboard >>./HelpMan/xclipboard.txt
whatis xclipboard >>./HelpMan/xclipboard.txt
xclipboard --help >>./HelpMan/xclipboard.txt
man xclipboard >>./HelpMan/xclipboard.txt
