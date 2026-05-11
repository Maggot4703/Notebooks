#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gipddecode.txt
which gipddecode >>./HelpMan/gipddecode.txt
whatis gipddecode >>./HelpMan/gipddecode.txt
gipddecode --help >>./HelpMan/gipddecode.txt
man gipddecode >>./HelpMan/gipddecode.txt
