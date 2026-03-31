#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gcalccmd.txt
which gcalccmd >>./HelpMan/gcalccmd.txt
whatis gcalccmd >>./HelpMan/gcalccmd.txt
gcalccmd --help >>./HelpMan/gcalccmd.txt
man gcalccmd >>./HelpMan/gcalccmd.txt
