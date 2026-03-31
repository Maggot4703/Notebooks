#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xtables-legacy-multi.txt
which xtables-legacy-multi >>./HelpMan/xtables-legacy-multi.txt
whatis xtables-legacy-multi >>./HelpMan/xtables-legacy-multi.txt
xtables-legacy-multi --help >>./HelpMan/xtables-legacy-multi.txt
man xtables-legacy-multi >>./HelpMan/xtables-legacy-multi.txt
