#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lz4c.txt
which lz4c >>./HelpMan/lz4c.txt
whatis lz4c >>./HelpMan/lz4c.txt
lz4c --help >>./HelpMan/lz4c.txt
man lz4c >>./HelpMan/lz4c.txt
