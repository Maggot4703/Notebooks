#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/timeout.txt
which timeout >>./HelpMan/timeout.txt
whatis timeout >>./HelpMan/timeout.txt
timeout --help >>./HelpMan/timeout.txt
man timeout >>./HelpMan/timeout.txt
