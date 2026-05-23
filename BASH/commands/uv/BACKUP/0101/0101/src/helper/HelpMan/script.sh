#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/script.txt
which script >>./HelpMan/script.txt
whatis script >>./HelpMan/script.txt
script --help >>./HelpMan/script.txt
man script >>./HelpMan/script.txt
