#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/symcryptrun.txt
which symcryptrun >>./HelpMan/symcryptrun.txt
whatis symcryptrun >>./HelpMan/symcryptrun.txt
symcryptrun --help >>./HelpMan/symcryptrun.txt
man symcryptrun >>./HelpMan/symcryptrun.txt
