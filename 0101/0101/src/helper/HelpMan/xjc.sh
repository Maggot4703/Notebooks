#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xjc.txt
which xjc >>./HelpMan/xjc.txt
whatis xjc >>./HelpMan/xjc.txt
xjc --help >>./HelpMan/xjc.txt
man xjc >>./HelpMan/xjc.txt
