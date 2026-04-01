#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mrd.txt
which mrd >>./HelpMan/mrd.txt
whatis mrd >>./HelpMan/mrd.txt
mrd --help >>./HelpMan/mrd.txt
man mrd >>./HelpMan/mrd.txt
