#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tzconfig.txt
which tzconfig >>./HelpMan/tzconfig.txt
whatis tzconfig >>./HelpMan/tzconfig.txt
tzconfig --help >>./HelpMan/tzconfig.txt
man tzconfig >>./HelpMan/tzconfig.txt
