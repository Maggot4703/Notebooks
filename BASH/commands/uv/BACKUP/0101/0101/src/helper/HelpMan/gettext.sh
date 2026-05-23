#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gettext.txt
which gettext >>./HelpMan/gettext.txt
whatis gettext >>./HelpMan/gettext.txt
gettext --help >>./HelpMan/gettext.txt
man gettext >>./HelpMan/gettext.txt
