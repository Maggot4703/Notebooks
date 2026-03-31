#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mdir.txt
which mdir >>./HelpMan/mdir.txt
whatis mdir >>./HelpMan/mdir.txt
mdir --help >>./HelpMan/mdir.txt
man mdir >>./HelpMan/mdir.txt
