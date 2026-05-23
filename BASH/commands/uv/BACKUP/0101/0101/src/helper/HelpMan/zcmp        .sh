#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zcmp.txt
which zcmp >>./HelpMan/zcmp.txt
whatis zcmp >>./HelpMan/zcmp.txt
zcmp --help >>./HelpMan/zcmp.txt
man zcmp >>./HelpMan/zcmp.txt
