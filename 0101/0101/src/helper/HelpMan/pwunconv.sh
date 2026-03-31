#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pwunconv.txt
which pwunconv >>./HelpMan/pwunconv.txt
whatis pwunconv >>./HelpMan/pwunconv.txt
pwunconv --help >>./HelpMan/pwunconv.txt
man pwunconv >>./HelpMan/pwunconv.txt
