#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gsnd.txt
which gsnd >>./HelpMan/gsnd.txt
whatis gsnd >>./HelpMan/gsnd.txt
gsnd --help >>./HelpMan/gsnd.txt
man gsnd >>./HelpMan/gsnd.txt
