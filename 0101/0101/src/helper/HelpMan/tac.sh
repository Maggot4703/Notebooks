#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tac.txt
which tac >>./HelpMan/tac.txt
whatis tac >>./HelpMan/tac.txt
tac --help >>./HelpMan/tac.txt
man tac >>./HelpMan/tac.txt
