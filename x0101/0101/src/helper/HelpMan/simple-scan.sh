#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/simple-scan.txt
which simple-scan >>./HelpMan/simple-scan.txt
whatis simple-scan >>./HelpMan/simple-scan.txt
simple-scan --help >>./HelpMan/simple-scan.txt
man simple-scan >>./HelpMan/simple-scan.txt
