#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/listres.txt
which listres >>./HelpMan/listres.txt
whatis listres >>./HelpMan/listres.txt
listres --help >>./HelpMan/listres.txt
man listres >>./HelpMan/listres.txt
