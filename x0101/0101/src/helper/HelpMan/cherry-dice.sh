#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cherry-dice.txt
which cherry-dice >>./HelpMan/cherry-dice.txt
whatis cherry-dice >>./HelpMan/cherry-dice.txt
cherry-dice --help >>./HelpMan/cherry-dice.txt
man cherry-dice >>./HelpMan/cherry-dice.txt
