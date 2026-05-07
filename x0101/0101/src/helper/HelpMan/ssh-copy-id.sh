#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ssh-copy-id.txt
which ssh-copy-id >>./HelpMan/ssh-copy-id.txt
whatis ssh-copy-id >>./HelpMan/ssh-copy-id.txt
ssh-copy-id --help >>./HelpMan/ssh-copy-id.txt
man ssh-copy-id >>./HelpMan/ssh-copy-id.txt
