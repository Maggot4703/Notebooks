#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ptargrep.txt
which ptargrep >>./HelpMan/ptargrep.txt
whatis ptargrep >>./HelpMan/ptargrep.txt
ptargrep --help >>./HelpMan/ptargrep.txt
man ptargrep >>./HelpMan/ptargrep.txt
