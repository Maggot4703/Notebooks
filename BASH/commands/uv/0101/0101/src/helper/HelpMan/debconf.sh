#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debconf.txt
which debconf >>./HelpMan/debconf.txt
whatis debconf >>./HelpMan/debconf.txt
debconf --help >>./HelpMan/debconf.txt
man debconf >>./HelpMan/debconf.txt
