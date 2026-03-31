#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ssh-argv0.txt
which ssh-argv0 >>./HelpMan/ssh-argv0.txt
whatis ssh-argv0 >>./HelpMan/ssh-argv0.txt
ssh-argv0 --help >>./HelpMan/ssh-argv0.txt
man ssh-argv0 >>./HelpMan/ssh-argv0.txt
