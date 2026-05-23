#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/switch_root.txt
which switch_root >>./HelpMan/switch_root.txt
whatis switch_root >>./HelpMan/switch_root.txt
switch_root --help >>./HelpMan/switch_root.txt
man switch_root >>./HelpMan/switch_root.txt
