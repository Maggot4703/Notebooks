#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/man-recode.txt
which man-recode >>./HelpMan/man-recode.txt
whatis man-recode >>./HelpMan/man-recode.txt
man-recode --help >>./HelpMan/man-recode.txt
man man-recode >>./HelpMan/man-recode.txt
