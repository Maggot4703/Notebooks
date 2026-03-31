#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pax11publish.txt
which pax11publish >>./HelpMan/pax11publish.txt
whatis pax11publish >>./HelpMan/pax11publish.txt
pax11publish --help >>./HelpMan/pax11publish.txt
man pax11publish >>./HelpMan/pax11publish.txt
