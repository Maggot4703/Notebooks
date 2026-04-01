#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mcat.txt
which mcat >>./HelpMan/mcat.txt
whatis mcat >>./HelpMan/mcat.txt
mcat --help >>./HelpMan/mcat.txt
man mcat >>./HelpMan/mcat.txt
