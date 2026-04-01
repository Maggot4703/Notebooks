#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdfdetach.txt
which pdfdetach >>./HelpMan/pdfdetach.txt
whatis pdfdetach >>./HelpMan/pdfdetach.txt
pdfdetach --help >>./HelpMan/pdfdetach.txt
man pdfdetach >>./HelpMan/pdfdetach.txt
