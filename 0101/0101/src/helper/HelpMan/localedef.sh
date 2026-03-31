#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/localedef.txt
which localedef >>./HelpMan/localedef.txt
whatis localedef >>./HelpMan/localedef.txt
localedef --help >>./HelpMan/localedef.txt
man localedef >>./HelpMan/localedef.txt
