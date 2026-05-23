#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ping.txt
which ping >>./HelpMan/ping.txt
whatis ping >>./HelpMan/ping.txt
ping --help >>./HelpMan/ping.txt
man ping >>./HelpMan/ping.txt
