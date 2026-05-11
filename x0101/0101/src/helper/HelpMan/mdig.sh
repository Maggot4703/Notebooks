#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mdig.txt
which mdig >>./HelpMan/mdig.txt
whatis mdig >>./HelpMan/mdig.txt
mdig --help >>./HelpMan/mdig.txt
man mdig >>./HelpMan/mdig.txt
