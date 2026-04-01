#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/flock.txt
which flock >>./HelpMan/flock.txt
whatis flock >>./HelpMan/flock.txt
flock --help >>./HelpMan/flock.txt
man flock >>./HelpMan/flock.txt
