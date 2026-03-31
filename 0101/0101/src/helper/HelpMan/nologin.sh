#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nologin.txt
which nologin >>./HelpMan/nologin.txt
whatis nologin >>./HelpMan/nologin.txt
nologin --help >>./HelpMan/nologin.txt
man nologin >>./HelpMan/nologin.txt
