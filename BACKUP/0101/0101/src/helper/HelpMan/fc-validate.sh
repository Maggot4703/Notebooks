#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fc-validate.txt
which fc-validate >>./HelpMan/fc-validate.txt
whatis fc-validate >>./HelpMan/fc-validate.txt
fc-validate --help >>./HelpMan/fc-validate.txt
man fc-validate >>./HelpMan/fc-validate.txt
