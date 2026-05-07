#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/stty.txt
which stty >>./HelpMan/stty.txt
whatis stty >>./HelpMan/stty.txt
stty --help >>./HelpMan/stty.txt
man stty >>./HelpMan/stty.txt
