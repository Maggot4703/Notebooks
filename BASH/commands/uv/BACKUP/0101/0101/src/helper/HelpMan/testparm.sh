#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/testparm.txt
which testparm >>./HelpMan/testparm.txt
whatis testparm >>./HelpMan/testparm.txt
testparm --help >>./HelpMan/testparm.txt
man testparm >>./HelpMan/testparm.txt
