#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jcmd.txt
which jcmd >>./HelpMan/jcmd.txt
whatis jcmd >>./HelpMan/jcmd.txt
jcmd --help >>./HelpMan/jcmd.txt
man jcmd >>./HelpMan/jcmd.txt
