#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/uuidgen.txt
which uuidgen >>./HelpMan/uuidgen.txt
whatis uuidgen >>./HelpMan/uuidgen.txt
uuidgen --help >>./HelpMan/uuidgen.txt
man uuidgen >>./HelpMan/uuidgen.txt
