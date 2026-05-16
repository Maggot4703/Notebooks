#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grep.txt
which grep >>./HelpMan/grep.txt
whatis grep >>./HelpMan/grep.txt
grep --help >>./HelpMan/grep.txt
man grep >>./HelpMan/grep.txt
