#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/saned.txt
which saned >>./HelpMan/saned.txt
whatis saned >>./HelpMan/saned.txt
saned --help >>./HelpMan/saned.txt
man saned >>./HelpMan/saned.txt
