#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rfcomm.txt
which rfcomm >>./HelpMan/rfcomm.txt
whatis rfcomm >>./HelpMan/rfcomm.txt
rfcomm --help >>./HelpMan/rfcomm.txt
man rfcomm >>./HelpMan/rfcomm.txt
