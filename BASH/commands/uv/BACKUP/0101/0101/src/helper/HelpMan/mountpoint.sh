#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mountpoint.txt
which mountpoint >>./HelpMan/mountpoint.txt
whatis mountpoint >>./HelpMan/mountpoint.txt
mountpoint --help >>./HelpMan/mountpoint.txt
man mountpoint >>./HelpMan/mountpoint.txt
