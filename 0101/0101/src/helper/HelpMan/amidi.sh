#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/amidi.txt
which amidi >>./HelpMan/amidi.txt
whatis amidi >>./HelpMan/amidi.txt
amidi --help >>./HelpMan/amidi.txt
man amidi >>./HelpMan/amidi.txt
