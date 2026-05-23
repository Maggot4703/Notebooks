#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/partprobe.txt
which partprobe >>./HelpMan/partprobe.txt
whatis partprobe >>./HelpMan/partprobe.txt
partprobe --help >>./HelpMan/partprobe.txt
man partprobe >>./HelpMan/partprobe.txt
