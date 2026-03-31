#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/atom.apm.txt
which atom.apm >>./HelpMan/atom.apm.txt
whatis atom.apm >>./HelpMan/atom.apm.txt
atom.apm --help >>./HelpMan/atom.apm.txt
man atom.apm >>./HelpMan/atom.apm.txt
