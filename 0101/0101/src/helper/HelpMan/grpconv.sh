#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/grpconv.txt
which grpconv >>./HelpMan/grpconv.txt
whatis grpconv >>./HelpMan/grpconv.txt
grpconv --help >>./HelpMan/grpconv.txt
man grpconv >>./HelpMan/grpconv.txt
