#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/totem.txt
which totem >>./HelpMan/totem.txt
whatis totem >>./HelpMan/totem.txt
totem --help >>./HelpMan/totem.txt
man totem >>./HelpMan/totem.txt
