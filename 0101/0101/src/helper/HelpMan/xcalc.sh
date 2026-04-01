#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xcalc.txt
which xcalc >>./HelpMan/xcalc.txt
whatis xcalc >>./HelpMan/xcalc.txt
xcalc --help >>./HelpMan/xcalc.txt
man xcalc >>./HelpMan/xcalc.txt
