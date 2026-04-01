#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/zipinfo.txt
which zipinfo >>./HelpMan/zipinfo.txt
whatis zipinfo >>./HelpMan/zipinfo.txt
zipinfo --help >>./HelpMan/zipinfo.txt
man zipinfo >>./HelpMan/zipinfo.txt
