#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nmtui-edit.txt
which nmtui-edit >>./HelpMan/nmtui-edit.txt
whatis nmtui-edit >>./HelpMan/nmtui-edit.txt
nmtui-edit --help >>./HelpMan/nmtui-edit.txt
man nmtui-edit >>./HelpMan/nmtui-edit.txt
