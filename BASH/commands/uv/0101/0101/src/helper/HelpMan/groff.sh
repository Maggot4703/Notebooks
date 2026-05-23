#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/groff.txt
which groff >>./HelpMan/groff.txt
whatis groff >>./HelpMan/groff.txt
groff --help >>./HelpMan/groff.txt
man groff >>./HelpMan/groff.txt
