#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mcd.txt
which mcd >>./HelpMan/mcd.txt
whatis mcd >>./HelpMan/mcd.txt
mcd --help >>./HelpMan/mcd.txt
man mcd >>./HelpMan/mcd.txt
