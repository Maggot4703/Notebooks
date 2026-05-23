#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ionice.txt
which ionice >>./HelpMan/ionice.txt
whatis ionice >>./HelpMan/ionice.txt
ionice --help >>./HelpMan/ionice.txt
man ionice >>./HelpMan/ionice.txt
