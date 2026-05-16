#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pdf2ps.txt
which pdf2ps >>./HelpMan/pdf2ps.txt
whatis pdf2ps >>./HelpMan/pdf2ps.txt
pdf2ps --help >>./HelpMan/pdf2ps.txt
man pdf2ps >>./HelpMan/pdf2ps.txt
