#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/delv.txt
which delv >>./HelpMan/delv.txt
whatis delv >>./HelpMan/delv.txt
delv --help >>./HelpMan/delv.txt
man delv >>./HelpMan/delv.txt
