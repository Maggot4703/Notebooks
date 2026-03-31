#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdfinfo.txt
which pdfinfo >>./HelpMan/pdfinfo.txt
whatis pdfinfo >>./HelpMan/pdfinfo.txt
pdfinfo --help >>./HelpMan/pdfinfo.txt
man pdfinfo >>./HelpMan/pdfinfo.txt
