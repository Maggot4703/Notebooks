#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/deluser.txt
which deluser >>./HelpMan/deluser.txt
whatis deluser >>./HelpMan/deluser.txt
deluser --help >>./HelpMan/deluser.txt
man deluser >>./HelpMan/deluser.txt
