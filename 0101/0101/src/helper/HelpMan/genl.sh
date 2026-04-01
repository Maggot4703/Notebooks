#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/genl.txt
which genl >>./HelpMan/genl.txt
whatis genl >>./HelpMan/genl.txt
genl --help >>./HelpMan/genl.txt
man genl >>./HelpMan/genl.txt
