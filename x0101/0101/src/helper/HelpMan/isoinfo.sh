#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/isoinfo.txt
which isoinfo >>./HelpMan/isoinfo.txt
whatis isoinfo >>./HelpMan/isoinfo.txt
isoinfo --help >>./HelpMan/isoinfo.txt
man isoinfo >>./HelpMan/isoinfo.txt
