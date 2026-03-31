#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debconf-show.txt
which debconf-show >>./HelpMan/debconf-show.txt
whatis debconf-show >>./HelpMan/debconf-show.txt
debconf-show --help >>./HelpMan/debconf-show.txt
man debconf-show >>./HelpMan/debconf-show.txt
