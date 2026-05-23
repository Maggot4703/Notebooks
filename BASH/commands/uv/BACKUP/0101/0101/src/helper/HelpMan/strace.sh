#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/strace.txt
which strace >>./HelpMan/strace.txt
whatis strace >>./HelpMan/strace.txt
strace --help >>./HelpMan/strace.txt
man strace >>./HelpMan/strace.txt
