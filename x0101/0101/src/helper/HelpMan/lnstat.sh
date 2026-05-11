#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lnstat.txt
which lnstat >>./HelpMan/lnstat.txt
whatis lnstat >>./HelpMan/lnstat.txt
lnstat --help >>./HelpMan/lnstat.txt
man lnstat >>./HelpMan/lnstat.txt
