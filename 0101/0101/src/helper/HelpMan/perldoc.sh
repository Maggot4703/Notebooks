#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/perldoc.txt
which perldoc >>./HelpMan/perldoc.txt
whatis perldoc >>./HelpMan/perldoc.txt
perldoc --help >>./HelpMan/perldoc.txt
man perldoc >>./HelpMan/perldoc.txt
