#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/loweb.txt
which loweb >>./HelpMan/loweb.txt
whatis loweb >>./HelpMan/loweb.txt
loweb --help >>./HelpMan/loweb.txt
man loweb >>./HelpMan/loweb.txt
