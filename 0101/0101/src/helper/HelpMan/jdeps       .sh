#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jdeps.txt
which jdeps >>./HelpMan/jdeps.txt
whatis jdeps >>./HelpMan/jdeps.txt
jdeps --help >>./HelpMan/jdeps.txt
man jdeps >>./HelpMan/jdeps.txt
