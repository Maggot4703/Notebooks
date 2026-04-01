#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkzftree.txt
which mkzftree >>./HelpMan/mkzftree.txt
whatis mkzftree >>./HelpMan/mkzftree.txt
mkzftree --help >>./HelpMan/mkzftree.txt
man mkzftree >>./HelpMan/mkzftree.txt
