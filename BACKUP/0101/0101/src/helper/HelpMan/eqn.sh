#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/eqn.txt
which eqn >>./HelpMan/eqn.txt
whatis eqn >>./HelpMan/eqn.txt
eqn --help >>./HelpMan/eqn.txt
man eqn >>./HelpMan/eqn.txt
