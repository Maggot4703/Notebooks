#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bsd-write.txt
which bsd-write >>./HelpMan/bsd-write.txt
whatis bsd-write >>./HelpMan/bsd-write.txt
bsd-write --help >>./HelpMan/bsd-write.txt
man bsd-write >>./HelpMan/bsd-write.txt
