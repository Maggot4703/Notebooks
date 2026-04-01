#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/base32.txt
which base32 >>./HelpMan/base32.txt
whatis base32 >>./HelpMan/base32.txt
base32 --help >>./HelpMan/base32.txt
man base32 >>./HelpMan/base32.txt
