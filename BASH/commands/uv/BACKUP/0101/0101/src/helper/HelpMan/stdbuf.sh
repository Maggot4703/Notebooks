#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/stdbuf.txt
which stdbuf >>./HelpMan/stdbuf.txt
whatis stdbuf >>./HelpMan/stdbuf.txt
stdbuf --help >>./HelpMan/stdbuf.txt
man stdbuf >>./HelpMan/stdbuf.txt
