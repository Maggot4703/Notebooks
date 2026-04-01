#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mtools.txt
which mtools >>./HelpMan/mtools.txt
whatis mtools >>./HelpMan/mtools.txt
mtools --help >>./HelpMan/mtools.txt
man mtools >>./HelpMan/mtools.txt
