#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mapfile.txt
which mapfile >>./HelpMan/mapfile.txt
whatis mapfile >>./HelpMan/mapfile.txt
mapfile --help >>./HelpMan/mapfile.txt
man mapfile >>./HelpMan/mapfile.txt
