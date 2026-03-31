#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lesspipe.txt
which lesspipe >>./HelpMan/lesspipe.txt
whatis lesspipe >>./HelpMan/lesspipe.txt
lesspipe --help >>./HelpMan/lesspipe.txt
man lesspipe >>./HelpMan/lesspipe.txt
