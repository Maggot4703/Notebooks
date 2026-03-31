#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/tee.txt
which tee >>./HelpMan/tee.txt
whatis tee >>./HelpMan/tee.txt
tee --help >>./HelpMan/tee.txt
man tee >>./HelpMan/tee.txt
