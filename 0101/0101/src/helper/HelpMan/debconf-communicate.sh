#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debconf-communicate.txt
which debconf-communicate >>./HelpMan/debconf-communicate.txt
whatis debconf-communicate >>./HelpMan/debconf-communicate.txt
debconf-communicate --help >>./HelpMan/debconf-communicate.txt
man debconf-communicate >>./HelpMan/debconf-communicate.txt
