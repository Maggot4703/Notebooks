#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/c99-gcc.txt
which c99-gcc >>./HelpMan/c99-gcc.txt
whatis c99-gcc >>./HelpMan/c99-gcc.txt
c99-gcc --help >>./HelpMan/c99-gcc.txt
man c99-gcc >>./HelpMan/c99-gcc.txt
