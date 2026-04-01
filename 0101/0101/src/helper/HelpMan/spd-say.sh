#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/spd-say.txt
which spd-say >>./HelpMan/spd-say.txt
whatis spd-say >>./HelpMan/spd-say.txt
spd-say --help >>./HelpMan/spd-say.txt
man spd-say >>./HelpMan/spd-say.txt
