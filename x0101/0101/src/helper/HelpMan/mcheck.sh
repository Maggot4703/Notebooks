#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mcheck.txt
which mcheck >>./HelpMan/mcheck.txt
whatis mcheck >>./HelpMan/mcheck.txt
mcheck --help >>./HelpMan/mcheck.txt
man mcheck >>./HelpMan/mcheck.txt
