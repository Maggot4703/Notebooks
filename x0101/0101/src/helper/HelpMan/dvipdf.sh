#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/dvipdf.txt
which dvipdf >>./HelpMan/dvipdf.txt
whatis dvipdf >>./HelpMan/dvipdf.txt
dvipdf --help >>./HelpMan/dvipdf.txt
man dvipdf >>./HelpMan/dvipdf.txt
