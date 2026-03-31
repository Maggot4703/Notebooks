#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/apropos.txt
which apropos >>./HelpMan/apropos.txt
whatis apropos >>./HelpMan/apropos.txt
apropos --help >>./HelpMan/apropos.txt
man apropos >>./HelpMan/apropos.txt
