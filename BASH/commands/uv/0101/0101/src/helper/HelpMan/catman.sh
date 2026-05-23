#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/catman.txt
which catman >>./HelpMan/catman.txt
whatis catman >>./HelpMan/catman.txt
catman --help >>./HelpMan/catman.txt
man catman >>./HelpMan/catman.txt
