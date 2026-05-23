#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pmap.txt
which pmap >>./HelpMan/pmap.txt
whatis pmap >>./HelpMan/pmap.txt
pmap --help >>./HelpMan/pmap.txt
man pmap >>./HelpMan/pmap.txt
