#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bzexe.txt
which bzexe >>./HelpMan/bzexe.txt
whatis bzexe >>./HelpMan/bzexe.txt
bzexe --help >>./HelpMan/bzexe.txt
man bzexe >>./HelpMan/bzexe.txt
