#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/resizecons.txt
which resizecons >>./HelpMan/resizecons.txt
whatis resizecons >>./HelpMan/resizecons.txt
resizecons --help >>./HelpMan/resizecons.txt
man resizecons >>./HelpMan/resizecons.txt
