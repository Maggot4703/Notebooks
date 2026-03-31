#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ssh-add.txt
which ssh-add >>./HelpMan/ssh-add.txt
whatis ssh-add >>./HelpMan/ssh-add.txt
ssh-add --help >>./HelpMan/ssh-add.txt
man ssh-add >>./HelpMan/ssh-add.txt
