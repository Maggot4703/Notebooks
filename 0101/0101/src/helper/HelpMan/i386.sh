#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/i386.txt
which i386 >>./HelpMan/i386.txt
whatis i386 >>./HelpMan/i386.txt
i386 --help >>./HelpMan/i386.txt
man i386 >>./HelpMan/i386.txt
