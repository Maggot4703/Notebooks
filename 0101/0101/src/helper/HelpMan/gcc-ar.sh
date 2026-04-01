#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcc-ar.txt
which gcc-ar >>./HelpMan/gcc-ar.txt
whatis gcc-ar >>./HelpMan/gcc-ar.txt
gcc-ar --help >>./HelpMan/gcc-ar.txt
man gcc-ar >>./HelpMan/gcc-ar.txt
