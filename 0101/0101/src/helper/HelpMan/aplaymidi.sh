#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/aplaymidi.txt
which aplaymidi >>./HelpMan/aplaymidi.txt
whatis aplaymidi >>./HelpMan/aplaymidi.txt
aplaymidi --help >>./HelpMan/aplaymidi.txt
man aplaymidi >>./HelpMan/aplaymidi.txt
