#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rev.txt
which rev >>./HelpMan/rev.txt
whatis rev >>./HelpMan/rev.txt
rev --help >>./HelpMan/rev.txt
man rev >>./HelpMan/rev.txt
