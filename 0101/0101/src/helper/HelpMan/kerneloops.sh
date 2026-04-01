#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kerneloops.txt
which kerneloops >>./HelpMan/kerneloops.txt
whatis kerneloops >>./HelpMan/kerneloops.txt
kerneloops --help >>./HelpMan/kerneloops.txt
man kerneloops >>./HelpMan/kerneloops.txt
