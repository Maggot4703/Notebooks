#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jrunscript.txt
which jrunscript >>./HelpMan/jrunscript.txt
whatis jrunscript >>./HelpMan/jrunscript.txt
jrunscript --help >>./HelpMan/jrunscript.txt
man jrunscript >>./HelpMan/jrunscript.txt
