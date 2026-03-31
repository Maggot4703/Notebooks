#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lzmore.txt
which lzmore >>./HelpMan/lzmore.txt
whatis lzmore >>./HelpMan/lzmore.txt
lzmore --help >>./HelpMan/lzmore.txt
man lzmore >>./HelpMan/lzmore.txt
