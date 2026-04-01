#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/encguess.txt
which encguess >>./HelpMan/encguess.txt
whatis encguess >>./HelpMan/encguess.txt
encguess --help >>./HelpMan/encguess.txt
man encguess >>./HelpMan/encguess.txt
