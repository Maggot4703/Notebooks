#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lzegrep.txt
which lzegrep >>./HelpMan/lzegrep.txt
whatis lzegrep >>./HelpMan/lzegrep.txt
lzegrep --help >>./HelpMan/lzegrep.txt
man lzegrep >>./HelpMan/lzegrep.txt
