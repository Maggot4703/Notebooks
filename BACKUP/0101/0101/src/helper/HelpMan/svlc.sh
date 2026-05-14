#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/svlc.txt
which svlc >>./HelpMan/svlc.txt
whatis svlc >>./HelpMan/svlc.txt
svlc --help >>./HelpMan/svlc.txt
man svlc >>./HelpMan/svlc.txt
