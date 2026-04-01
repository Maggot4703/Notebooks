#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/e2scrub_all.txt
which e2scrub_all >>./HelpMan/e2scrub_all.txt
whatis e2scrub_all >>./HelpMan/e2scrub_all.txt
e2scrub_all --help >>./HelpMan/e2scrub_all.txt
man e2scrub_all >>./HelpMan/e2scrub_all.txt
