#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debconf-apt-progress.txt
which debconf-apt-progress >>./HelpMan/debconf-apt-progress.txt
whatis debconf-apt-progress >>./HelpMan/debconf-apt-progress.txt
debconf-apt-progress --help >>./HelpMan/debconf-apt-progress.txt
man debconf-apt-progress >>./HelpMan/debconf-apt-progress.txt
