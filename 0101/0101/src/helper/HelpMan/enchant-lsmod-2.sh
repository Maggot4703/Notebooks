#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/enchant-lsmod-2.txt
which enchant-lsmod-2 >>./HelpMan/enchant-lsmod-2.txt
whatis enchant-lsmod-2 >>./HelpMan/enchant-lsmod-2.txt
enchant-lsmod-2 --help >>./HelpMan/enchant-lsmod-2.txt
man enchant-lsmod-2 >>./HelpMan/enchant-lsmod-2.txt
