#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/xsm.txt
which xsm >>./HelpMan/xsm.txt
whatis xsm >>./HelpMan/xsm.txt
xsm --help >>./HelpMan/xsm.txt
man xsm >>./HelpMan/xsm.txt
