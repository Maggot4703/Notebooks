#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/geany.txt
which geany >>./HelpMan/geany.txt
whatis geany >>./HelpMan/geany.txt
geany --help >>./HelpMan/geany.txt
man geany >>./HelpMan/geany.txt
