#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/e2image.txt
which e2image >>./HelpMan/e2image.txt
whatis e2image >>./HelpMan/e2image.txt
e2image --help >>./HelpMan/e2image.txt
man e2image >>./HelpMan/e2image.txt
