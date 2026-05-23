#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rcp.txt
which rcp >>./HelpMan/rcp.txt
whatis rcp >>./HelpMan/rcp.txt
rcp --help >>./HelpMan/rcp.txt
man rcp >>./HelpMan/rcp.txt
