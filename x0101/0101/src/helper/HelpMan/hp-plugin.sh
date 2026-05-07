#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-plugin.txt
which hp-plugin >>./HelpMan/hp-plugin.txt
whatis hp-plugin >>./HelpMan/hp-plugin.txt
hp-plugin --help >>./HelpMan/hp-plugin.txt
man hp-plugin >>./HelpMan/hp-plugin.txt
