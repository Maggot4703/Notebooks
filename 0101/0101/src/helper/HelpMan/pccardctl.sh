#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pccardctl.txt
which pccardctl >>./HelpMan/pccardctl.txt
whatis pccardctl >>./HelpMan/pccardctl.txt
pccardctl --help >>./HelpMan/pccardctl.txt
man pccardctl >>./HelpMan/pccardctl.txt
