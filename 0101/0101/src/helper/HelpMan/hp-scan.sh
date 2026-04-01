#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-scan.txt
which hp-scan >>./HelpMan/hp-scan.txt
whatis hp-scan >>./HelpMan/hp-scan.txt
hp-scan --help >>./HelpMan/hp-scan.txt
man hp-scan >>./HelpMan/hp-scan.txt
