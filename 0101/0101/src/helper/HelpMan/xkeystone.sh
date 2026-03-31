#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xkeystone.txt
which xkeystone >>./HelpMan/xkeystone.txt
whatis xkeystone >>./HelpMan/xkeystone.txt
xkeystone --help >>./HelpMan/xkeystone.txt
man xkeystone >>./HelpMan/xkeystone.txt
