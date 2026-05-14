#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/spd-conf.txt
which spd-conf >>./HelpMan/spd-conf.txt
whatis spd-conf >>./HelpMan/spd-conf.txt
spd-conf --help >>./HelpMan/spd-conf.txt
man spd-conf >>./HelpMan/spd-conf.txt
