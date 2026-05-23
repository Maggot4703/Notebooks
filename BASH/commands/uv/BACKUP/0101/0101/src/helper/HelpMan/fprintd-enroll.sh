#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/fprintd-enroll.txt
which fprintd-enroll >>./HelpMan/fprintd-enroll.txt
whatis fprintd-enroll >>./HelpMan/fprintd-enroll.txt
fprintd-enroll --help >>./HelpMan/fprintd-enroll.txt
man fprintd-enroll >>./HelpMan/fprintd-enroll.txt
