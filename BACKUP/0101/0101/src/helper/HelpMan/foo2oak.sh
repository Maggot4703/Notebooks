#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/foo2oak.txt
which foo2oak >>./HelpMan/foo2oak.txt
whatis foo2oak >>./HelpMan/foo2oak.txt
foo2oak --help >>./HelpMan/foo2oak.txt
man foo2oak >>./HelpMan/foo2oak.txt
