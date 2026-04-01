#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lp.txt
which lp >>./HelpMan/lp.txt
whatis lp >>./HelpMan/lp.txt
lp --help >>./HelpMan/lp.txt
man lp >>./HelpMan/lp.txt
