#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lz4.txt
which lz4 >>./HelpMan/lz4.txt
whatis lz4 >>./HelpMan/lz4.txt
lz4 --help >>./HelpMan/lz4.txt
man lz4 >>./HelpMan/lz4.txt
