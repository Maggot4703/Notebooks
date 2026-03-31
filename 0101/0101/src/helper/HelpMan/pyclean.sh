#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pyclean.txt
which pyclean >>./HelpMan/pyclean.txt
whatis pyclean >>./HelpMan/pyclean.txt
pyclean --help >>./HelpMan/pyclean.txt
man pyclean >>./HelpMan/pyclean.txt
