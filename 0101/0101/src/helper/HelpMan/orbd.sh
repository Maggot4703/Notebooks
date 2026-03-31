#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/orbd.txt
which orbd >>./HelpMan/orbd.txt
whatis orbd >>./HelpMan/orbd.txt
orbd --help >>./HelpMan/orbd.txt
man orbd >>./HelpMan/orbd.txt
