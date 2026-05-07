#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pterm.txt
which pterm >>./HelpMan/pterm.txt
whatis pterm >>./HelpMan/pterm.txt
pterm --help >>./HelpMan/pterm.txt
man pterm >>./HelpMan/pterm.txt
