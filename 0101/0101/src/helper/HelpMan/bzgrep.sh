#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bzgrep.txt
which bzgrep >>./HelpMan/bzgrep.txt
whatis bzgrep >>./HelpMan/bzgrep.txt
bzgrep --help >>./HelpMan/bzgrep.txt
man bzgrep >>./HelpMan/bzgrep.txt
