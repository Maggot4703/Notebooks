#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/appletviewer.txt
which appletviewer >>./HelpMan/appletviewer.txt
whatis appletviewer >>./HelpMan/appletviewer.txt
appletviewer --help >>./HelpMan/appletviewer.txt
man appletviewer >>./HelpMan/appletviewer.txt
