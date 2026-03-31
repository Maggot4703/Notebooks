#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/readelf.txt
which readelf >>./HelpMan/readelf.txt
whatis readelf >>./HelpMan/readelf.txt
readelf --help >>./HelpMan/readelf.txt
man readelf >>./HelpMan/readelf.txt
