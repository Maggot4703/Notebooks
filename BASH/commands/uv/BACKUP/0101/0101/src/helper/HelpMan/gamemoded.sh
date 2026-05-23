#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gamemoded.txt
which gamemoded >>./HelpMan/gamemoded.txt
whatis gamemoded >>./HelpMan/gamemoded.txt
gamemoded --help >>./HelpMan/gamemoded.txt
man gamemoded >>./HelpMan/gamemoded.txt
