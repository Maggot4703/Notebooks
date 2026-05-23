#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lsmod.txt
which lsmod >>./HelpMan/lsmod.txt
whatis lsmod >>./HelpMan/lsmod.txt
lsmod --help >>./HelpMan/lsmod.txt
man lsmod >>./HelpMan/lsmod.txt
