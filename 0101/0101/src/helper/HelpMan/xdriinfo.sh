#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xdriinfo.txt
which xdriinfo >>./HelpMan/xdriinfo.txt
whatis xdriinfo >>./HelpMan/xdriinfo.txt
xdriinfo --help >>./HelpMan/xdriinfo.txt
man xdriinfo >>./HelpMan/xdriinfo.txt
