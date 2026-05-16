#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lsattr.txt
which lsattr >>./HelpMan/lsattr.txt
whatis lsattr >>./HelpMan/lsattr.txt
lsattr --help >>./HelpMan/lsattr.txt
man lsattr >>./HelpMan/lsattr.txt
