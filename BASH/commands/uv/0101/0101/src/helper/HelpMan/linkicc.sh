#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/linkicc.txt
which linkicc >>./HelpMan/linkicc.txt
whatis linkicc >>./HelpMan/linkicc.txt
linkicc --help >>./HelpMan/linkicc.txt
man linkicc >>./HelpMan/linkicc.txt
