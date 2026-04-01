#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tzselect.txt
which tzselect >>./HelpMan/tzselect.txt
whatis tzselect >>./HelpMan/tzselect.txt
tzselect --help >>./HelpMan/tzselect.txt
man tzselect >>./HelpMan/tzselect.txt
