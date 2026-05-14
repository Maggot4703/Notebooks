#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/atom.txt
which atom >>./HelpMan/atom.txt
whatis atom >>./HelpMan/atom.txt
atom --help >>./HelpMan/atom.txt
man atom >>./HelpMan/atom.txt
