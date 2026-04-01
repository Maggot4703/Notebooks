#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/e2label.txt
which e2label >>./HelpMan/e2label.txt
whatis e2label >>./HelpMan/e2label.txt
e2label --help >>./HelpMan/e2label.txt
man e2label >>./HelpMan/e2label.txt
