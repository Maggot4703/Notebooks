#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/wsgen.txt
which wsgen >>./HelpMan/wsgen.txt
whatis wsgen >>./HelpMan/wsgen.txt
wsgen --help >>./HelpMan/wsgen.txt
man wsgen >>./HelpMan/wsgen.txt
