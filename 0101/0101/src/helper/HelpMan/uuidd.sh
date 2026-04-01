#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/uuidd.txt
which uuidd >>./HelpMan/uuidd.txt
whatis uuidd >>./HelpMan/uuidd.txt
uuidd --help >>./HelpMan/uuidd.txt
man uuidd >>./HelpMan/uuidd.txt
