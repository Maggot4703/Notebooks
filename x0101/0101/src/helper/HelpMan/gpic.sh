#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gpic.txt
which gpic >>./HelpMan/gpic.txt
whatis gpic >>./HelpMan/gpic.txt
gpic --help >>./HelpMan/gpic.txt
man gpic >>./HelpMan/gpic.txt
