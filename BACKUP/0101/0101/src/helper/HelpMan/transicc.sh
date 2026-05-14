#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/transicc.txt
which transicc >>./HelpMan/transicc.txt
whatis transicc >>./HelpMan/transicc.txt
transicc --help >>./HelpMan/transicc.txt
man transicc >>./HelpMan/transicc.txt
