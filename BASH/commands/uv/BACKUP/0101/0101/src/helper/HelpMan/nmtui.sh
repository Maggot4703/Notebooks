#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nmtui.txt
which nmtui >>./HelpMan/nmtui.txt
whatis nmtui >>./HelpMan/nmtui.txt
nmtui --help >>./HelpMan/nmtui.txt
man nmtui >>./HelpMan/nmtui.txt
