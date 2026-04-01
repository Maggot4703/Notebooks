#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pkaction.txt
which pkaction >>./HelpMan/pkaction.txt
whatis pkaction >>./HelpMan/pkaction.txt
pkaction --help >>./HelpMan/pkaction.txt
man pkaction >>./HelpMan/pkaction.txt
