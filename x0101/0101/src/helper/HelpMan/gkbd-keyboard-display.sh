#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gkbd-keyboard-display.txt
which gkbd-keyboard-display >>./HelpMan/gkbd-keyboard-display.txt
whatis gkbd-keyboard-display >>./HelpMan/gkbd-keyboard-display.txt
gkbd-keyboard-display --help >>./HelpMan/gkbd-keyboard-display.txt
man gkbd-keyboard-display >>./HelpMan/gkbd-keyboard-display.txt
