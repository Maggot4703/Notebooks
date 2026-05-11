#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gsdj500.txt
which gsdj500 >>./HelpMan/gsdj500.txt
whatis gsdj500 >>./HelpMan/gsdj500.txt
gsdj500 --help >>./HelpMan/gsdj500.txt
man gsdj500 >>./HelpMan/gsdj500.txt
