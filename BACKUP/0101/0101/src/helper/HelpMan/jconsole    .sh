#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/jconsole.txt
which jconsole >>./HelpMan/jconsole.txt
whatis jconsole >>./HelpMan/jconsole.txt
jconsole --help >>./HelpMan/jconsole.txt
man jconsole >>./HelpMan/jconsole.txt
