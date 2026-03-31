#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cppw.txt
which cppw >>./HelpMan/cppw.txt
whatis cppw >>./HelpMan/cppw.txt
cppw --help >>./HelpMan/cppw.txt
man cppw >>./HelpMan/cppw.txt
