#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lscpu.txt
which lscpu >>./HelpMan/lscpu.txt
whatis lscpu >>./HelpMan/lscpu.txt
lscpu --help >>./HelpMan/lscpu.txt
man lscpu >>./HelpMan/lscpu.txt
