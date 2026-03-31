#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mdu.txt
which mdu >>./HelpMan/mdu.txt
whatis mdu >>./HelpMan/mdu.txt
mdu --help >>./HelpMan/mdu.txt
man mdu >>./HelpMan/mdu.txt
