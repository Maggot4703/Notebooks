#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fc-match.txt
which fc-match >>./HelpMan/fc-match.txt
whatis fc-match >>./HelpMan/fc-match.txt
fc-match --help >>./HelpMan/fc-match.txt
man fc-match >>./HelpMan/fc-match.txt
