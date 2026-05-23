#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/init.txt
which init >>./HelpMan/init.txt
whatis init >>./HelpMan/init.txt
init --help >>./HelpMan/init.txt
man init >>./HelpMan/init.txt
