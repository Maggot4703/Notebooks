#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mmd.txt
which mmd >>./HelpMan/mmd.txt
whatis mmd >>./HelpMan/mmd.txt
mmd --help >>./HelpMan/mmd.txt
man mmd >>./HelpMan/mmd.txt
