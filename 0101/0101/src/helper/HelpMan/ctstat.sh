#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ctstat.txt
which ctstat >>./HelpMan/ctstat.txt
whatis ctstat >>./HelpMan/ctstat.txt
ctstat --help >>./HelpMan/ctstat.txt
man ctstat >>./HelpMan/ctstat.txt
