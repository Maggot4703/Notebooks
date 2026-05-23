#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mshortname.txt
which mshortname >>./HelpMan/mshortname.txt
whatis mshortname >>./HelpMan/mshortname.txt
mshortname --help >>./HelpMan/mshortname.txt
man mshortname >>./HelpMan/mshortname.txt
