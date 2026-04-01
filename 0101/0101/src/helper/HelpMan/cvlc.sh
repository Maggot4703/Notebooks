#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cvlc.txt
which cvlc >>./HelpMan/cvlc.txt
whatis cvlc >>./HelpMan/cvlc.txt
cvlc --help >>./HelpMan/cvlc.txt
man cvlc >>./HelpMan/cvlc.txt
