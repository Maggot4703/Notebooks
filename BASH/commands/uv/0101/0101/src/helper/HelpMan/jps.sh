#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jps.txt
which jps >>./HelpMan/jps.txt
whatis jps >>./HelpMan/jps.txt
jps --help >>./HelpMan/jps.txt
man jps >>./HelpMan/jps.txt
