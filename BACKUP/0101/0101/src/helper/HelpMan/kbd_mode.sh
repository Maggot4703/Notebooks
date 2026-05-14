#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kbd_mode.txt
which kbd_mode >>./HelpMan/kbd_mode.txt
whatis kbd_mode >>./HelpMan/kbd_mode.txt
kbd_mode --help >>./HelpMan/kbd_mode.txt
man kbd_mode >>./HelpMan/kbd_mode.txt
