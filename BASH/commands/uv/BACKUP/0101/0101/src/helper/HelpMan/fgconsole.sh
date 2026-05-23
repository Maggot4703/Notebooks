#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fgconsole.txt
which fgconsole >>./HelpMan/fgconsole.txt
whatis fgconsole >>./HelpMan/fgconsole.txt
fgconsole --help >>./HelpMan/fgconsole.txt
man fgconsole >>./HelpMan/fgconsole.txt
