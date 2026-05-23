#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/m2400w.txt
which m2400w >>./HelpMan/m2400w.txt
whatis m2400w >>./HelpMan/m2400w.txt
m2400w --help >>./HelpMan/m2400w.txt
man m2400w >>./HelpMan/m2400w.txt
