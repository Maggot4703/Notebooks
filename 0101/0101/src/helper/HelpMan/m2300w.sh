#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/m2300w.txt
which m2300w >>./HelpMan/m2300w.txt
whatis m2300w >>./HelpMan/m2300w.txt
m2300w --help >>./HelpMan/m2300w.txt
man m2300w >>./HelpMan/m2300w.txt
