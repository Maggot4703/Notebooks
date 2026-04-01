#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sdiff.txt
which sdiff >>./HelpMan/sdiff.txt
whatis sdiff >>./HelpMan/sdiff.txt
sdiff --help >>./HelpMan/sdiff.txt
man sdiff >>./HelpMan/sdiff.txt
