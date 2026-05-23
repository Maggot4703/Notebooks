#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcc-ranlib-9.txt
which gcc-ranlib-9 >>./HelpMan/gcc-ranlib-9.txt
whatis gcc-ranlib-9 >>./HelpMan/gcc-ranlib-9.txt
gcc-ranlib-9 --help >>./HelpMan/gcc-ranlib-9.txt
man gcc-ranlib-9 >>./HelpMan/gcc-ranlib-9.txt
