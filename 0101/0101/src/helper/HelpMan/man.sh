#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/man.txt
which man >>./HelpMan/man.txt
whatis man >>./HelpMan/man.txt
man --help >>./HelpMan/man.txt
man man >>./HelpMan/man.txt
