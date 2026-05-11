#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rake.txt
which rake >>./HelpMan/rake.txt
whatis rake >>./HelpMan/rake.txt
rake --help >>./HelpMan/rake.txt
man rake >>./HelpMan/rake.txt
