#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lofromtemplate.txt
which lofromtemplate >>./HelpMan/lofromtemplate.txt
whatis lofromtemplate >>./HelpMan/lofromtemplate.txt
lofromtemplate --help >>./HelpMan/lofromtemplate.txt
man lofromtemplate >>./HelpMan/lofromtemplate.txt
