#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pfbtopfa.txt
which pfbtopfa >>./HelpMan/pfbtopfa.txt
whatis pfbtopfa >>./HelpMan/pfbtopfa.txt
pfbtopfa --help >>./HelpMan/pfbtopfa.txt
man pfbtopfa >>./HelpMan/pfbtopfa.txt
