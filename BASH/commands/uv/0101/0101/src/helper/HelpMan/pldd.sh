#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pldd.txt
which pldd >>./HelpMan/pldd.txt
whatis pldd >>./HelpMan/pldd.txt
pldd --help >>./HelpMan/pldd.txt
man pldd >>./HelpMan/pldd.txt
