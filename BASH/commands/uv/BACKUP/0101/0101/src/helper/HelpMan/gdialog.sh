#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/gdialog.txt
which gdialog >>./HelpMan/gdialog.txt
whatis gdialog >>./HelpMan/gdialog.txt
gdialog --help >>./HelpMan/gdialog.txt
man gdialog >>./HelpMan/gdialog.txt
