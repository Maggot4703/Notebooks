#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debconf-escape.txt
which debconf-escape >>./HelpMan/debconf-escape.txt
whatis debconf-escape >>./HelpMan/debconf-escape.txt
debconf-escape --help >>./HelpMan/debconf-escape.txt
man debconf-escape >>./HelpMan/debconf-escape.txt
