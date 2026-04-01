#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bzfgrep.txt
which bzfgrep >>./HelpMan/bzfgrep.txt
whatis bzfgrep >>./HelpMan/bzfgrep.txt
bzfgrep --help >>./HelpMan/bzfgrep.txt
man bzfgrep >>./HelpMan/bzfgrep.txt
