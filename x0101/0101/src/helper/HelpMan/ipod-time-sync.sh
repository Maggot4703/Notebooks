#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ipod-time-sync.txt
which ipod-time-sync >>./HelpMan/ipod-time-sync.txt
whatis ipod-time-sync >>./HelpMan/ipod-time-sync.txt
ipod-time-sync --help >>./HelpMan/ipod-time-sync.txt
man ipod-time-sync >>./HelpMan/ipod-time-sync.txt
