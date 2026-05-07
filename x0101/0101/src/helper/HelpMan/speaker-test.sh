#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/speaker-test.txt
which speaker-test >>./HelpMan/speaker-test.txt
whatis speaker-test >>./HelpMan/speaker-test.txt
speaker-test --help >>./HelpMan/speaker-test.txt
man speaker-test >>./HelpMan/speaker-test.txt
