#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/brltty-ctb.txt
which brltty-ctb >>./HelpMan/brltty-ctb.txt
whatis brltty-ctb >>./HelpMan/brltty-ctb.txt
brltty-ctb --help >>./HelpMan/brltty-ctb.txt
man brltty-ctb >>./HelpMan/brltty-ctb.txt
