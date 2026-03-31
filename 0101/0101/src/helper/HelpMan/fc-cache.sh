#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fc-cache.txt
which fc-cache >>./HelpMan/fc-cache.txt
whatis fc-cache >>./HelpMan/fc-cache.txt
fc-cache --help >>./HelpMan/fc-cache.txt
man fc-cache >>./HelpMan/fc-cache.txt
