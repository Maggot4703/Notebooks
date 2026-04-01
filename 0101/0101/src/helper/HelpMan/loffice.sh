#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/loffice.txt
which loffice >>./HelpMan/loffice.txt
whatis loffice >>./HelpMan/loffice.txt
loffice --help >>./HelpMan/loffice.txt
man loffice >>./HelpMan/loffice.txt
