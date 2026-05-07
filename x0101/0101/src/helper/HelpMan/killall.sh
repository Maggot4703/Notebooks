#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/killall.txt
which killall >>./HelpMan/killall.txt
whatis killall >>./HelpMan/killall.txt
killall --help >>./HelpMan/killall.txt
man killall >>./HelpMan/killall.txt
