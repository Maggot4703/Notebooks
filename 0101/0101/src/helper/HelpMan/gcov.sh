#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcov.txt
which gcov >>./HelpMan/gcov.txt
whatis gcov >>./HelpMan/gcov.txt
gcov --help >>./HelpMan/gcov.txt
man gcov >>./HelpMan/gcov.txt
