#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iwlist.txt
which iwlist >>./HelpMan/iwlist.txt
whatis iwlist >>./HelpMan/iwlist.txt
iwlist --help >>./HelpMan/iwlist.txt
man iwlist >>./HelpMan/iwlist.txt
