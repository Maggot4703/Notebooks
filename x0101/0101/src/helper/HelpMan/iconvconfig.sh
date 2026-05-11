#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/iconvconfig.txt
which iconvconfig >>./HelpMan/iconvconfig.txt
whatis iconvconfig >>./HelpMan/iconvconfig.txt
iconvconfig --help >>./HelpMan/iconvconfig.txt
man iconvconfig >>./HelpMan/iconvconfig.txt
