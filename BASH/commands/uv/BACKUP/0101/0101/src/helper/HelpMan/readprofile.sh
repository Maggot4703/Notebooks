#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/readprofile.txt
which readprofile >>./HelpMan/readprofile.txt
whatis readprofile >>./HelpMan/readprofile.txt
readprofile --help >>./HelpMan/readprofile.txt
man readprofile >>./HelpMan/readprofile.txt
