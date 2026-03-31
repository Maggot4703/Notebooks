#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/amuFormat.sh.txt
which amuFormat.sh >>./HelpMan/amuFormat.sh.txt
whatis amuFormat.sh >>./HelpMan/amuFormat.sh.txt
amuFormat.sh --help >>./HelpMan/amuFormat.sh.txt
man amuFormat.sh >>./HelpMan/amuFormat.sh.txt
