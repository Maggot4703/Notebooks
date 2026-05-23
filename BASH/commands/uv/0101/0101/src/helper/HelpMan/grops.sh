#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grops.txt
which grops >>./HelpMan/grops.txt
whatis grops >>./HelpMan/grops.txt
grops --help >>./HelpMan/grops.txt
man grops >>./HelpMan/grops.txt
