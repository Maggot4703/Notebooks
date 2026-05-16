#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cautious-launcher.txt
which cautious-launcher >>./HelpMan/cautious-launcher.txt
whatis cautious-launcher >>./HelpMan/cautious-launcher.txt
cautious-launcher --help >>./HelpMan/cautious-launcher.txt
man cautious-launcher >>./HelpMan/cautious-launcher.txt
