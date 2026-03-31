#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/parec.txt
which parec >>./HelpMan/parec.txt
whatis parec >>./HelpMan/parec.txt
parec --help >>./HelpMan/parec.txt
man parec >>./HelpMan/parec.txt
