#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/nm-online.txt
which nm-online >>./HelpMan/nm-online.txt
whatis nm-online >>./HelpMan/nm-online.txt
nm-online --help >>./HelpMan/nm-online.txt
man nm-online >>./HelpMan/nm-online.txt
