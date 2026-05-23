#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/runlevel.txt
which runlevel >>./HelpMan/runlevel.txt
whatis runlevel >>./HelpMan/runlevel.txt
runlevel --help >>./HelpMan/runlevel.txt
man runlevel >>./HelpMan/runlevel.txt
