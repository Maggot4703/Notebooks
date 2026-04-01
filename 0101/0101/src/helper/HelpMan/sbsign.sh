#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/sbsign.txt
which sbsign >>./HelpMan/sbsign.txt
whatis sbsign >>./HelpMan/sbsign.txt
sbsign --help >>./HelpMan/sbsign.txt
man sbsign >>./HelpMan/sbsign.txt
