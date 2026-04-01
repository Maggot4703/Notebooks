#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcov-dump.txt
which gcov-dump >>./HelpMan/gcov-dump.txt
whatis gcov-dump >>./HelpMan/gcov-dump.txt
gcov-dump --help >>./HelpMan/gcov-dump.txt
man gcov-dump >>./HelpMan/gcov-dump.txt
