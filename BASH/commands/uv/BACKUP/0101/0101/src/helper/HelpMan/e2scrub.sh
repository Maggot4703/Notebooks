#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/e2scrub.txt
which e2scrub >>./HelpMan/e2scrub.txt
whatis e2scrub >>./HelpMan/e2scrub.txt
e2scrub --help >>./HelpMan/e2scrub.txt
man e2scrub >>./HelpMan/e2scrub.txt
