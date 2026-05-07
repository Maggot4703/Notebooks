#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/savelog.txt
which savelog >>./HelpMan/savelog.txt
whatis savelog >>./HelpMan/savelog.txt
savelog --help >>./HelpMan/savelog.txt
man savelog >>./HelpMan/savelog.txt
