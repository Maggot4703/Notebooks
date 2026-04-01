#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x86_64-linux-gnu-gcov.txt
which x86_64-linux-gnu-gcov >>./HelpMan/x86_64-linux-gnu-gcov.txt
whatis x86_64-linux-gnu-gcov >>./HelpMan/x86_64-linux-gnu-gcov.txt
x86_64-linux-gnu-gcov --help >>./HelpMan/x86_64-linux-gnu-gcov.txt
man x86_64-linux-gnu-gcov >>./HelpMan/x86_64-linux-gnu-gcov.txt
