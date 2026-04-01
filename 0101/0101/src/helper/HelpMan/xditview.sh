#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xditview.txt
which xditview >>./HelpMan/xditview.txt
whatis xditview >>./HelpMan/xditview.txt
xditview --help >>./HelpMan/xditview.txt
man xditview >>./HelpMan/xditview.txt
