#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lzless.txt
which lzless >>./HelpMan/lzless.txt
whatis lzless >>./HelpMan/lzless.txt
lzless --help >>./HelpMan/lzless.txt
man lzless >>./HelpMan/lzless.txt
