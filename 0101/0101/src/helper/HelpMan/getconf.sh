#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/getconf.txt
which getconf >>./HelpMan/getconf.txt
whatis getconf >>./HelpMan/getconf.txt
getconf --help >>./HelpMan/getconf.txt
man getconf >>./HelpMan/getconf.txt
