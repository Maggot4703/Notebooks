#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/erb2.7.txt
which erb2.7 >>./HelpMan/erb2.7.txt
whatis erb2.7 >>./HelpMan/erb2.7.txt
erb2.7 --help >>./HelpMan/erb2.7.txt
man erb2.7 >>./HelpMan/erb2.7.txt
