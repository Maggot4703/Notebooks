#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jexec.txt
which jexec >>./HelpMan/jexec.txt
whatis jexec >>./HelpMan/jexec.txt
jexec --help >>./HelpMan/jexec.txt
man jexec >>./HelpMan/jexec.txt
