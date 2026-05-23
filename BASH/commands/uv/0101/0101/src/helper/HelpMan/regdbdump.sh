#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/regdbdump.txt
which regdbdump >>./HelpMan/regdbdump.txt
whatis regdbdump >>./HelpMan/regdbdump.txt
regdbdump --help >>./HelpMan/regdbdump.txt
man regdbdump >>./HelpMan/regdbdump.txt
