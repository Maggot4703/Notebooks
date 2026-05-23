#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/captoinfo.txt
which captoinfo >>./HelpMan/captoinfo.txt
whatis captoinfo >>./HelpMan/captoinfo.txt
captoinfo --help >>./HelpMan/captoinfo.txt
man captoinfo >>./HelpMan/captoinfo.txt
