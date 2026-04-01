#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cancel.txt
which cancel >>./HelpMan/cancel.txt
whatis cancel >>./HelpMan/cancel.txt
cancel --help >>./HelpMan/cancel.txt
man cancel >>./HelpMan/cancel.txt
