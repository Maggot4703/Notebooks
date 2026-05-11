#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lslocks.txt
which lslocks >>./HelpMan/lslocks.txt
whatis lslocks >>./HelpMan/lslocks.txt
lslocks --help >>./HelpMan/lslocks.txt
man lslocks >>./HelpMan/lslocks.txt
