#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xvidtune.txt
which xvidtune >>./HelpMan/xvidtune.txt
whatis xvidtune >>./HelpMan/xvidtune.txt
xvidtune --help >>./HelpMan/xvidtune.txt
man xvidtune >>./HelpMan/xvidtune.txt
