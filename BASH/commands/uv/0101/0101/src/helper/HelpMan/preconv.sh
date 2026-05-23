#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/preconv.txt
which preconv >>./HelpMan/preconv.txt
whatis preconv >>./HelpMan/preconv.txt
preconv --help >>./HelpMan/preconv.txt
man preconv >>./HelpMan/preconv.txt
