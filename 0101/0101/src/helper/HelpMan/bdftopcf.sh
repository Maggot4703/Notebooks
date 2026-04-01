#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bdftopcf.txt
which bdftopcf >>./HelpMan/bdftopcf.txt
whatis bdftopcf >>./HelpMan/bdftopcf.txt
bdftopcf --help >>./HelpMan/bdftopcf.txt
man bdftopcf >>./HelpMan/bdftopcf.txt
