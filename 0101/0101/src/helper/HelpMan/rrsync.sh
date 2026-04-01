#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rrsync.txt
which rrsync >>./HelpMan/rrsync.txt
whatis rrsync >>./HelpMan/rrsync.txt
rrsync --help >>./HelpMan/rrsync.txt
man rrsync >>./HelpMan/rrsync.txt
