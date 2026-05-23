#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mc.txt
which mc >>./HelpMan/mc.txt
whatis mc >>./HelpMan/mc.txt
mc --help >>./HelpMan/mc.txt
man mc >>./HelpMan/mc.txt
