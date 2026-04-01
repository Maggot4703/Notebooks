#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/enchant-2.txt
which enchant-2 >>./HelpMan/enchant-2.txt
whatis enchant-2 >>./HelpMan/enchant-2.txt
enchant-2 --help >>./HelpMan/enchant-2.txt
man enchant-2 >>./HelpMan/enchant-2.txt
