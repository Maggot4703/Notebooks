#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/loimpress.txt
which loimpress >>./HelpMan/loimpress.txt
whatis loimpress >>./HelpMan/loimpress.txt
loimpress --help >>./HelpMan/loimpress.txt
man loimpress >>./HelpMan/loimpress.txt
