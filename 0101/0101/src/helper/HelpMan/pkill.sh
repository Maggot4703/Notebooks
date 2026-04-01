#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pkill.txt
which pkill >>./HelpMan/pkill.txt
whatis pkill >>./HelpMan/pkill.txt
pkill --help >>./HelpMan/pkill.txt
man pkill >>./HelpMan/pkill.txt
