#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mzip.txt
which mzip >>./HelpMan/mzip.txt
whatis mzip >>./HelpMan/mzip.txt
mzip --help >>./HelpMan/mzip.txt
man mzip >>./HelpMan/mzip.txt
