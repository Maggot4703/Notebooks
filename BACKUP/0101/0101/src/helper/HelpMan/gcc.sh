#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcc.txt
which gcc >>./HelpMan/gcc.txt
whatis gcc >>./HelpMan/gcc.txt
gcc --help >>./HelpMan/gcc.txt
man gcc >>./HelpMan/gcc.txt
