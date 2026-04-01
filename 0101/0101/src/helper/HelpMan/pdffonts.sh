#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdffonts.txt
which pdffonts >>./HelpMan/pdffonts.txt
whatis pdffonts >>./HelpMan/pdffonts.txt
pdffonts --help >>./HelpMan/pdffonts.txt
man pdffonts >>./HelpMan/pdffonts.txt
