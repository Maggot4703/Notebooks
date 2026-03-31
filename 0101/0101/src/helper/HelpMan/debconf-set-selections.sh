#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debconf-set-selections.txt
which debconf-set-selections >>./HelpMan/debconf-set-selections.txt
whatis debconf-set-selections >>./HelpMan/debconf-set-selections.txt
debconf-set-selections --help >>./HelpMan/debconf-set-selections.txt
man debconf-set-selections >>./HelpMan/debconf-set-selections.txt
