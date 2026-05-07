#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/b2sum.txt
which b2sum >>./HelpMan/b2sum.txt
whatis b2sum >>./HelpMan/b2sum.txt
b2sum --help >>./HelpMan/b2sum.txt
man b2sum >>./HelpMan/b2sum.txt
