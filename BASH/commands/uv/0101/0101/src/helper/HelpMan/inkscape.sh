#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/inkscape.txt
which inkscape >>./HelpMan/inkscape.txt
whatis inkscape >>./HelpMan/inkscape.txt
inkscape --help >>./HelpMan/inkscape.txt
man inkscape >>./HelpMan/inkscape.txt
