#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdfunite.txt
which pdfunite >>./HelpMan/pdfunite.txt
whatis pdfunite >>./HelpMan/pdfunite.txt
pdfunite --help >>./HelpMan/pdfunite.txt
man pdfunite >>./HelpMan/pdfunite.txt
