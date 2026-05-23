#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/htop.txt
which htop >>./HelpMan/htop.txt
whatis htop >>./HelpMan/htop.txt
htop --help >>./HelpMan/htop.txt
man htop >>./HelpMan/htop.txt
