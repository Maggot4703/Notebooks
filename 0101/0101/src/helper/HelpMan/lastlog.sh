#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lastlog.txt
which lastlog >>./HelpMan/lastlog.txt
whatis lastlog >>./HelpMan/lastlog.txt
lastlog --help >>./HelpMan/lastlog.txt
man lastlog >>./HelpMan/lastlog.txt
