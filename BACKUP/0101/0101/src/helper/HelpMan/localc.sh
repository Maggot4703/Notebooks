#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/localc.txt
which localc >>./HelpMan/localc.txt
whatis localc >>./HelpMan/localc.txt
localc --help >>./HelpMan/localc.txt
man localc >>./HelpMan/localc.txt
