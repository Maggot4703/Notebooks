#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tarcat.txt
which tarcat >>./HelpMan/tarcat.txt
whatis tarcat >>./HelpMan/tarcat.txt
tarcat --help >>./HelpMan/tarcat.txt
man tarcat >>./HelpMan/tarcat.txt
