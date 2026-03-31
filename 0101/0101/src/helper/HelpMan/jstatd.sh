#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jstatd.txt
which jstatd >>./HelpMan/jstatd.txt
whatis jstatd >>./HelpMan/jstatd.txt
jstatd --help >>./HelpMan/jstatd.txt
man jstatd >>./HelpMan/jstatd.txt
