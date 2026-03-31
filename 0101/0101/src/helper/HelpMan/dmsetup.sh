#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dmsetup.txt
which dmsetup >>./HelpMan/dmsetup.txt
whatis dmsetup >>./HelpMan/dmsetup.txt
dmsetup --help >>./HelpMan/dmsetup.txt
man dmsetup >>./HelpMan/dmsetup.txt
