#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-makeuri.txt
which hp-makeuri >>./HelpMan/hp-makeuri.txt
whatis hp-makeuri >>./HelpMan/hp-makeuri.txt
hp-makeuri --help >>./HelpMan/hp-makeuri.txt
man hp-makeuri >>./HelpMan/hp-makeuri.txt
