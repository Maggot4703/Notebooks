#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xcutsel.txt
which xcutsel >>./HelpMan/xcutsel.txt
whatis xcutsel >>./HelpMan/xcutsel.txt
xcutsel --help >>./HelpMan/xcutsel.txt
man xcutsel >>./HelpMan/xcutsel.txt
