#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/command.txt
which command >>./HelpMan/command.txt
whatis command >>./HelpMan/command.txt
command --help >>./HelpMan/command.txt
man command >>./HelpMan/command.txt
