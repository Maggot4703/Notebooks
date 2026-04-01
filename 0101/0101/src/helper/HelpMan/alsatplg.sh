#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/alsatplg.txt
which alsatplg >>./HelpMan/alsatplg.txt
whatis alsatplg >>./HelpMan/alsatplg.txt
alsatplg --help >>./HelpMan/alsatplg.txt
man alsatplg >>./HelpMan/alsatplg.txt
