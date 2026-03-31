#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/manpath.txt
which manpath >>./HelpMan/manpath.txt
whatis manpath >>./HelpMan/manpath.txt
manpath --help >>./HelpMan/manpath.txt
man manpath >>./HelpMan/manpath.txt
