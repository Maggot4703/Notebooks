#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/insmod.txt
which insmod >>./HelpMan/insmod.txt
whatis insmod >>./HelpMan/insmod.txt
insmod --help >>./HelpMan/insmod.txt
man insmod >>./HelpMan/insmod.txt
