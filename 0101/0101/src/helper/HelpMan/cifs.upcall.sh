#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/cifs.upcall.txt
which cifs.upcall >>./HelpMan/cifs.upcall.txt
whatis cifs.upcall >>./HelpMan/cifs.upcall.txt
cifs.upcall --help >>./HelpMan/cifs.upcall.txt
man cifs.upcall >>./HelpMan/cifs.upcall.txt
