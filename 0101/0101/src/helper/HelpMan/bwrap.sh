#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bwrap.txt
which bwrap >>./HelpMan/bwrap.txt
whatis bwrap >>./HelpMan/bwrap.txt
bwrap --help >>./HelpMan/bwrap.txt
man bwrap >>./HelpMan/bwrap.txt
