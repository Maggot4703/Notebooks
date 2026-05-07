#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/date.txt
which date >>./HelpMan/date.txt
whatis date >>./HelpMan/date.txt
date --help >>./HelpMan/date.txt
man date >>./HelpMan/date.txt
