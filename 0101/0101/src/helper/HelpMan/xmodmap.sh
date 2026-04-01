#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xmodmap.txt
which xmodmap >>./HelpMan/xmodmap.txt
whatis xmodmap >>./HelpMan/xmodmap.txt
xmodmap --help >>./HelpMan/xmodmap.txt
man xmodmap >>./HelpMan/xmodmap.txt
