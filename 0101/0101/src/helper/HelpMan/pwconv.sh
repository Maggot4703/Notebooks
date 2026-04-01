#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pwconv.txt
which pwconv >>./HelpMan/pwconv.txt
whatis pwconv >>./HelpMan/pwconv.txt
pwconv --help >>./HelpMan/pwconv.txt
man pwconv >>./HelpMan/pwconv.txt
