#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tracker.txt
which tracker >>./HelpMan/tracker.txt
whatis tracker >>./HelpMan/tracker.txt
tracker --help >>./HelpMan/tracker.txt
man tracker >>./HelpMan/tracker.txt
