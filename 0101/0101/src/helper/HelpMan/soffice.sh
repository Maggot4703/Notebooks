#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/soffice.txt
which soffice >>./HelpMan/soffice.txt
whatis soffice >>./HelpMan/soffice.txt
soffice --help >>./HelpMan/soffice.txt
man soffice >>./HelpMan/soffice.txt
