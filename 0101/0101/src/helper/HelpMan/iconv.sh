#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iconv.txt
which iconv >>./HelpMan/iconv.txt
whatis iconv >>./HelpMan/iconv.txt
iconv --help >>./HelpMan/iconv.txt
man iconv >>./HelpMan/iconv.txt
