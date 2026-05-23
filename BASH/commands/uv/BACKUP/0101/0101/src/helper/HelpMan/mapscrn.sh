#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mapscrn.txt
which mapscrn >>./HelpMan/mapscrn.txt
whatis mapscrn >>./HelpMan/mapscrn.txt
mapscrn --help >>./HelpMan/mapscrn.txt
man mapscrn >>./HelpMan/mapscrn.txt
