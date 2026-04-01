#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/run-mailcap.txt
which run-mailcap >>./HelpMan/run-mailcap.txt
whatis run-mailcap >>./HelpMan/run-mailcap.txt
run-mailcap --help >>./HelpMan/run-mailcap.txt
man run-mailcap >>./HelpMan/run-mailcap.txt
