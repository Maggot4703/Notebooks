#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/soelim.txt
which soelim >>./HelpMan/soelim.txt
whatis soelim >>./HelpMan/soelim.txt
soelim --help >>./HelpMan/soelim.txt
man soelim >>./HelpMan/soelim.txt
