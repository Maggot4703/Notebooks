#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/perlbug.txt
which perlbug >>./HelpMan/perlbug.txt
whatis perlbug >>./HelpMan/perlbug.txt
perlbug --help >>./HelpMan/perlbug.txt
man perlbug >>./HelpMan/perlbug.txt
