#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mmount.txt
which mmount >>./HelpMan/mmount.txt
whatis mmount >>./HelpMan/mmount.txt
mmount --help >>./HelpMan/mmount.txt
man mmount >>./HelpMan/mmount.txt
