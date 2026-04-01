#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lesskey.txt
which lesskey >>./HelpMan/lesskey.txt
whatis lesskey >>./HelpMan/lesskey.txt
lesskey --help >>./HelpMan/lesskey.txt
man lesskey >>./HelpMan/lesskey.txt
