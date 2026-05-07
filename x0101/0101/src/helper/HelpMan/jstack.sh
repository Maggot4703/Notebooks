#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jstack.txt
which jstack >>./HelpMan/jstack.txt
whatis jstack >>./HelpMan/jstack.txt
jstack --help >>./HelpMan/jstack.txt
man jstack >>./HelpMan/jstack.txt
