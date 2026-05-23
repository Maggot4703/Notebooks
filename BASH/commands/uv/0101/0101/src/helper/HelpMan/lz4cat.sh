#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lz4cat.txt
which lz4cat >>./HelpMan/lz4cat.txt
whatis lz4cat >>./HelpMan/lz4cat.txt
lz4cat --help >>./HelpMan/lz4cat.txt
man lz4cat >>./HelpMan/lz4cat.txt
