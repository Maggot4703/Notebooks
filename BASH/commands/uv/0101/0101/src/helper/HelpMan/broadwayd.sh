#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/broadwayd.txt
which broadwayd >>./HelpMan/broadwayd.txt
whatis broadwayd >>./HelpMan/broadwayd.txt
broadwayd --help >>./HelpMan/broadwayd.txt
man broadwayd >>./HelpMan/broadwayd.txt
