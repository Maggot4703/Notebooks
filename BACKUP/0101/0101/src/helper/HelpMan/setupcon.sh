#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/setupcon.txt
which setupcon >>./HelpMan/setupcon.txt
whatis setupcon >>./HelpMan/setupcon.txt
setupcon --help >>./HelpMan/setupcon.txt
man setupcon >>./HelpMan/setupcon.txt
