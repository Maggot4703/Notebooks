#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2hiperc.txt
which foo2hiperc >>./HelpMan/foo2hiperc.txt
whatis foo2hiperc >>./HelpMan/foo2hiperc.txt
foo2hiperc --help >>./HelpMan/foo2hiperc.txt
man foo2hiperc >>./HelpMan/foo2hiperc.txt
