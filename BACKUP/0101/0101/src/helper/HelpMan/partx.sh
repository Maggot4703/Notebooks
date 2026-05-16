#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/partx.txt
which partx >>./HelpMan/partx.txt
whatis partx >>./HelpMan/partx.txt
partx --help >>./HelpMan/partx.txt
man partx >>./HelpMan/partx.txt
