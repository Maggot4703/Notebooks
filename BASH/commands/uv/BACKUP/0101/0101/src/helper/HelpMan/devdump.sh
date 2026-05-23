#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/devdump.txt
which devdump >>./HelpMan/devdump.txt
whatis devdump >>./HelpMan/devdump.txt
devdump --help >>./HelpMan/devdump.txt
man devdump >>./HelpMan/devdump.txt
