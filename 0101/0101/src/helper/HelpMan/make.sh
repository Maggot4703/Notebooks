#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/make.txt
which make >>./HelpMan/make.txt
whatis make >>./HelpMan/make.txt
make --help >>./HelpMan/make.txt
man make >>./HelpMan/make.txt
