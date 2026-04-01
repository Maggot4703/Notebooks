#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xconsole.txt
which xconsole >>./HelpMan/xconsole.txt
whatis xconsole >>./HelpMan/xconsole.txt
xconsole --help >>./HelpMan/xconsole.txt
man xconsole >>./HelpMan/xconsole.txt
