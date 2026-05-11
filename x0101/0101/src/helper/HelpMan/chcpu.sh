#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/chcpu.txt
which chcpu >>./HelpMan/chcpu.txt
whatis chcpu >>./HelpMan/chcpu.txt
chcpu --help >>./HelpMan/chcpu.txt
man chcpu >>./HelpMan/chcpu.txt
