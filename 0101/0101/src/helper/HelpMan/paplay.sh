#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/paplay.txt
which paplay >>./HelpMan/paplay.txt
whatis paplay >>./HelpMan/paplay.txt
paplay --help >>./HelpMan/paplay.txt
man paplay >>./HelpMan/paplay.txt
