#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/neqn.txt
which neqn >>./HelpMan/neqn.txt
whatis neqn >>./HelpMan/neqn.txt
neqn --help >>./HelpMan/neqn.txt
man neqn >>./HelpMan/neqn.txt
