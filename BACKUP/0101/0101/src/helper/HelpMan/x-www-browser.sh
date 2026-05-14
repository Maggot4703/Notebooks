#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/x-www-browser.txt
which x-www-browser >>./HelpMan/x-www-browser.txt
whatis x-www-browser >>./HelpMan/x-www-browser.txt
x-www-browser --help >>./HelpMan/x-www-browser.txt
man x-www-browser >>./HelpMan/x-www-browser.txt
