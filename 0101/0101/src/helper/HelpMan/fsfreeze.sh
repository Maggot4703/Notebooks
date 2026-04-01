#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fsfreeze.txt
which fsfreeze >>./HelpMan/fsfreeze.txt
whatis fsfreeze >>./HelpMan/fsfreeze.txt
fsfreeze --help >>./HelpMan/fsfreeze.txt
man fsfreeze >>./HelpMan/fsfreeze.txt
