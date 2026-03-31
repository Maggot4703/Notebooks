#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/scriptreplay.txt
which scriptreplay >>./HelpMan/scriptreplay.txt
whatis scriptreplay >>./HelpMan/scriptreplay.txt
scriptreplay --help >>./HelpMan/scriptreplay.txt
man scriptreplay >>./HelpMan/scriptreplay.txt
