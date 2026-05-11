#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/envsubst.txt
which envsubst >>./HelpMan/envsubst.txt
whatis envsubst >>./HelpMan/envsubst.txt
envsubst --help >>./HelpMan/envsubst.txt
man envsubst >>./HelpMan/envsubst.txt
