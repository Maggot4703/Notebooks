#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/lpinfo.txt
which lpinfo >>./HelpMan/lpinfo.txt
whatis lpinfo >>./HelpMan/lpinfo.txt
lpinfo --help >>./HelpMan/lpinfo.txt
man lpinfo >>./HelpMan/lpinfo.txt
