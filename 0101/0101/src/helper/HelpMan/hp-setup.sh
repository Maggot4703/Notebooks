#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/hp-setup.txt
which hp-setup >>./HelpMan/hp-setup.txt
whatis hp-setup >>./HelpMan/hp-setup.txt
hp-setup --help >>./HelpMan/hp-setup.txt
man hp-setup >>./HelpMan/hp-setup.txt
