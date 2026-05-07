#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/groupmems.txt
which groupmems >>./HelpMan/groupmems.txt
whatis groupmems >>./HelpMan/groupmems.txt
groupmems --help >>./HelpMan/groupmems.txt
man groupmems >>./HelpMan/groupmems.txt
