#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/geqn.txt
which geqn >>./HelpMan/geqn.txt
whatis geqn >>./HelpMan/geqn.txt
geqn --help >>./HelpMan/geqn.txt
man geqn >>./HelpMan/geqn.txt
