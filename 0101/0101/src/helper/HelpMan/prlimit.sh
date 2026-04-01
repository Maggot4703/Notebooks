#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/prlimit.txt
which prlimit >>./HelpMan/prlimit.txt
whatis prlimit >>./HelpMan/prlimit.txt
prlimit --help >>./HelpMan/prlimit.txt
man prlimit >>./HelpMan/prlimit.txt
