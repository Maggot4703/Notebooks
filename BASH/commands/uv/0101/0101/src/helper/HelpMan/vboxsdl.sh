#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/vboxsdl.txt
which vboxsdl >>./HelpMan/vboxsdl.txt
whatis vboxsdl >>./HelpMan/vboxsdl.txt
vboxsdl --help >>./HelpMan/vboxsdl.txt
man vboxsdl >>./HelpMan/vboxsdl.txt
