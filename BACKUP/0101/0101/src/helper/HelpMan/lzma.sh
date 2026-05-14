#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lzma.txt
which lzma >>./HelpMan/lzma.txt
whatis lzma >>./HelpMan/lzma.txt
lzma --help >>./HelpMan/lzma.txt
man lzma >>./HelpMan/lzma.txt
