#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcc-9.txt
which gcc-9 >>./HelpMan/gcc-9.txt
whatis gcc-9 >>./HelpMan/gcc-9.txt
gcc-9 --help >>./HelpMan/gcc-9.txt
man gcc-9 >>./HelpMan/gcc-9.txt
