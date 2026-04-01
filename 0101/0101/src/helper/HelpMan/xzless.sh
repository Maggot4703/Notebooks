#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xzless.txt
which xzless >>./HelpMan/xzless.txt
whatis xzless >>./HelpMan/xzless.txt
xzless --help >>./HelpMan/xzless.txt
man xzless >>./HelpMan/xzless.txt
