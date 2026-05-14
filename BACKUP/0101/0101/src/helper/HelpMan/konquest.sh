#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/konquest.txt
which konquest >>./HelpMan/konquest.txt
whatis konquest >>./HelpMan/konquest.txt
konquest --help >>./HelpMan/konquest.txt
man konquest >>./HelpMan/konquest.txt
