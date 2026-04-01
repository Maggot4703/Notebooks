#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/debconf-copydb.txt
which debconf-copydb >>./HelpMan/debconf-copydb.txt
whatis debconf-copydb >>./HelpMan/debconf-copydb.txt
debconf-copydb --help >>./HelpMan/debconf-copydb.txt
man debconf-copydb >>./HelpMan/debconf-copydb.txt
