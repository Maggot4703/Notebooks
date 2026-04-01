#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdfimages.txt
which pdfimages >>./HelpMan/pdfimages.txt
whatis pdfimages >>./HelpMan/pdfimages.txt
pdfimages --help >>./HelpMan/pdfimages.txt
man pdfimages >>./HelpMan/pdfimages.txt
