#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-query.txt
which hp-query >>./HelpMan/hp-query.txt
whatis hp-query >>./HelpMan/hp-query.txt
hp-query --help >>./HelpMan/hp-query.txt
man hp-query >>./HelpMan/hp-query.txt
