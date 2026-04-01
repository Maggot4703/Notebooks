#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ulimit.txt
which ulimit >>./HelpMan/ulimit.txt
whatis ulimit >>./HelpMan/ulimit.txt
ulimit --help >>./HelpMan/ulimit.txt
man ulimit >>./HelpMan/ulimit.txt
