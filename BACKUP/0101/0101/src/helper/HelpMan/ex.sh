#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ex.txt
which ex >>./HelpMan/ex.txt
whatis ex >>./HelpMan/ex.txt
ex --help >>./HelpMan/ex.txt
man ex >>./HelpMan/ex.txt
