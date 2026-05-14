#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tgz.txt
which tgz >>./HelpMan/tgz.txt
whatis tgz >>./HelpMan/tgz.txt
tgz --help >>./HelpMan/tgz.txt
man tgz >>./HelpMan/tgz.txt
