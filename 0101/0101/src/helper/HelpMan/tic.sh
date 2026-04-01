#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tic.txt
which tic >>./HelpMan/tic.txt
whatis tic >>./HelpMan/tic.txt
tic --help >>./HelpMan/tic.txt
man tic >>./HelpMan/tic.txt
