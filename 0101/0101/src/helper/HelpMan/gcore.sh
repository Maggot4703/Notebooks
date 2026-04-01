#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcore.txt
which gcore >>./HelpMan/gcore.txt
whatis gcore >>./HelpMan/gcore.txt
gcore --help >>./HelpMan/gcore.txt
man gcore >>./HelpMan/gcore.txt
