#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rdoc.txt
which rdoc >>./HelpMan/rdoc.txt
whatis rdoc >>./HelpMan/rdoc.txt
rdoc --help >>./HelpMan/rdoc.txt
man rdoc >>./HelpMan/rdoc.txt
