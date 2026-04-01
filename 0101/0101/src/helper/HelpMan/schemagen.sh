#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/schemagen.txt
which schemagen >>./HelpMan/schemagen.txt
whatis schemagen >>./HelpMan/schemagen.txt
schemagen --help >>./HelpMan/schemagen.txt
man schemagen >>./HelpMan/schemagen.txt
