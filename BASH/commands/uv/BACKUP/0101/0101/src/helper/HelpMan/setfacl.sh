#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/setfacl.txt
which setfacl >>./HelpMan/setfacl.txt
whatis setfacl >>./HelpMan/setfacl.txt
setfacl --help >>./HelpMan/setfacl.txt
man setfacl >>./HelpMan/setfacl.txt
