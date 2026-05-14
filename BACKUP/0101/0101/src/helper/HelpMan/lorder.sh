#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lorder.txt
which lorder >>./HelpMan/lorder.txt
whatis lorder >>./HelpMan/lorder.txt
lorder --help >>./HelpMan/lorder.txt
man lorder >>./HelpMan/lorder.txt
