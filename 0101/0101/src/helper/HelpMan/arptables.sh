#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/arptables.txt
which arptables >>./HelpMan/arptables.txt
whatis arptables >>./HelpMan/arptables.txt
arptables --help >>./HelpMan/arptables.txt
man arptables >>./HelpMan/arptables.txt
