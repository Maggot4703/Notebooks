#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mpartition.txt
which mpartition >>./HelpMan/mpartition.txt
whatis mpartition >>./HelpMan/mpartition.txt
mpartition --help >>./HelpMan/mpartition.txt
man mpartition >>./HelpMan/mpartition.txt
