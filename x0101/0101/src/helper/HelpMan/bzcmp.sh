#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bzcmp.txt
which bzcmp >>./HelpMan/bzcmp.txt
whatis bzcmp >>./HelpMan/bzcmp.txt
bzcmp --help >>./HelpMan/bzcmp.txt
man bzcmp >>./HelpMan/bzcmp.txt
