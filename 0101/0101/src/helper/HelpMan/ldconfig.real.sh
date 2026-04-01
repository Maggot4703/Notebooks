#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ldconfig.real.txt
which ldconfig.real >>./HelpMan/ldconfig.real.txt
whatis ldconfig.real >>./HelpMan/ldconfig.real.txt
ldconfig.real --help >>./HelpMan/ldconfig.real.txt
man ldconfig.real >>./HelpMan/ldconfig.real.txt
