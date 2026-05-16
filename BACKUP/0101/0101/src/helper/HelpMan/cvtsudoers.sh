#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cvtsudoers.txt
which cvtsudoers >>./HelpMan/cvtsudoers.txt
whatis cvtsudoers >>./HelpMan/cvtsudoers.txt
cvtsudoers --help >>./HelpMan/cvtsudoers.txt
man cvtsudoers >>./HelpMan/cvtsudoers.txt
