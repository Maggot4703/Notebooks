#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dash.txt
which dash >>./HelpMan/dash.txt
whatis dash >>./HelpMan/dash.txt
dash --help >>./HelpMan/dash.txt
man dash >>./HelpMan/dash.txt
