#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/setpriv.txt
which setpriv >>./HelpMan/setpriv.txt
whatis setpriv >>./HelpMan/setpriv.txt
setpriv --help >>./HelpMan/setpriv.txt
man setpriv >>./HelpMan/setpriv.txt
