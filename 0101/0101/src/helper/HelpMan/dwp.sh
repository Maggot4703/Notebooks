#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dwp.txt
which dwp >>./HelpMan/dwp.txt
whatis dwp >>./HelpMan/dwp.txt
dwp --help >>./HelpMan/dwp.txt
man dwp >>./HelpMan/dwp.txt
