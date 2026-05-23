#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/installkernel.txt
which installkernel >>./HelpMan/installkernel.txt
whatis installkernel >>./HelpMan/installkernel.txt
installkernel --help >>./HelpMan/installkernel.txt
man installkernel >>./HelpMan/installkernel.txt
