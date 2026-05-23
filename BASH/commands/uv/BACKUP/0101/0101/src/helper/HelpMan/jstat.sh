#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jstat.txt
which jstat >>./HelpMan/jstat.txt
whatis jstat >>./HelpMan/jstat.txt
jstat --help >>./HelpMan/jstat.txt
man jstat >>./HelpMan/jstat.txt
