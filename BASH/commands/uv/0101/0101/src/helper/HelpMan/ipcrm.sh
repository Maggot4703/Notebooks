#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/ipcrm.txt
which ipcrm >>./HelpMan/ipcrm.txt
whatis ipcrm >>./HelpMan/ipcrm.txt
ipcrm --help >>./HelpMan/ipcrm.txt
man ipcrm >>./HelpMan/ipcrm.txt
