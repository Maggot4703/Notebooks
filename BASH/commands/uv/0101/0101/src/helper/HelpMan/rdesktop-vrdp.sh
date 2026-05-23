#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rdesktop-vrdp.txt
which rdesktop-vrdp >>./HelpMan/rdesktop-vrdp.txt
whatis rdesktop-vrdp >>./HelpMan/rdesktop-vrdp.txt
rdesktop-vrdp --help >>./HelpMan/rdesktop-vrdp.txt
man rdesktop-vrdp >>./HelpMan/rdesktop-vrdp.txt
