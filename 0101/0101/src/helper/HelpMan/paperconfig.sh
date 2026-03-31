#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/paperconfig.txt
which paperconfig >>./HelpMan/paperconfig.txt
whatis paperconfig >>./HelpMan/paperconfig.txt
paperconfig --help >>./HelpMan/paperconfig.txt
man paperconfig >>./HelpMan/paperconfig.txt
