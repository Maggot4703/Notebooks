#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/as.txt
which as >>./HelpMan/as.txt
whatis as >>./HelpMan/as.txt
as --help >>./HelpMan/as.txt
man as >>./HelpMan/as.txt
