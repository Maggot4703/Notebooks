#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/set.txt
which set >>./HelpMan/set.txt
whatis set >>./HelpMan/set.txt
set --help >>./HelpMan/set.txt
man set >>./HelpMan/set.txt
