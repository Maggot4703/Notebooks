#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xlogo.txt
which xlogo >>./HelpMan/xlogo.txt
whatis xlogo >>./HelpMan/xlogo.txt
xlogo --help >>./HelpMan/xlogo.txt
man xlogo >>./HelpMan/xlogo.txt
