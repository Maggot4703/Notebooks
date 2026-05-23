#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fg.txt
which fg >>./HelpMan/fg.txt
whatis fg >>./HelpMan/fg.txt
fg --help >>./HelpMan/fg.txt
man fg >>./HelpMan/fg.txt
