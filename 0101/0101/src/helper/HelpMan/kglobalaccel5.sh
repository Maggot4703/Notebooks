#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/kglobalaccel5.txt
which kglobalaccel5 >>./HelpMan/kglobalaccel5.txt
whatis kglobalaccel5 >>./HelpMan/kglobalaccel5.txt
kglobalaccel5 --help >>./HelpMan/kglobalaccel5.txt
man kglobalaccel5 >>./HelpMan/kglobalaccel5.txt
