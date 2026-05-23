#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ps2ascii.txt
which ps2ascii >>./HelpMan/ps2ascii.txt
whatis ps2ascii >>./HelpMan/ps2ascii.txt
ps2ascii --help >>./HelpMan/ps2ascii.txt
man ps2ascii >>./HelpMan/ps2ascii.txt
