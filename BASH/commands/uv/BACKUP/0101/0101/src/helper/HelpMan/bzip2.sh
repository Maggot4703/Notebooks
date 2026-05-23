#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bzip2.txt
which bzip2 >>./HelpMan/bzip2.txt
whatis bzip2 >>./HelpMan/bzip2.txt
bzip2 --help >>./HelpMan/bzip2.txt
man bzip2 >>./HelpMan/bzip2.txt
