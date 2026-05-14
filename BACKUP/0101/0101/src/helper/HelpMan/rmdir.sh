#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rmdir.txt
which rmdir >>./HelpMan/rmdir.txt
whatis rmdir >>./HelpMan/rmdir.txt
rmdir --help >>./HelpMan/rmdir.txt
man rmdir >>./HelpMan/rmdir.txt
