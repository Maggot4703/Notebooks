#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sdptool.txt
which sdptool >>./HelpMan/sdptool.txt
whatis sdptool >>./HelpMan/sdptool.txt
sdptool --help >>./HelpMan/sdptool.txt
man sdptool >>./HelpMan/sdptool.txt
