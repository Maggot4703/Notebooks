#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pl2pm.txt
which pl2pm >>./HelpMan/pl2pm.txt
whatis pl2pm >>./HelpMan/pl2pm.txt
pl2pm --help >>./HelpMan/pl2pm.txt
man pl2pm >>./HelpMan/pl2pm.txt
