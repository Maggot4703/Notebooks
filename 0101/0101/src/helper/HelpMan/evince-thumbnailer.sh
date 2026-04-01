#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/evince-thumbnailer.txt
which evince-thumbnailer >>./HelpMan/evince-thumbnailer.txt
whatis evince-thumbnailer >>./HelpMan/evince-thumbnailer.txt
evince-thumbnailer --help >>./HelpMan/evince-thumbnailer.txt
man evince-thumbnailer >>./HelpMan/evince-thumbnailer.txt
