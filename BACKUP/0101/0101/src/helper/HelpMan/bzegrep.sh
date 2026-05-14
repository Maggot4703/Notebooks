#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/bzegrep.txt
which bzegrep >>./HelpMan/bzegrep.txt
whatis bzegrep >>./HelpMan/bzegrep.txt
bzegrep --help >>./HelpMan/bzegrep.txt
man bzegrep >>./HelpMan/bzegrep.txt
