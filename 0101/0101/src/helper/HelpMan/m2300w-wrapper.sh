#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/m2300w-wrapper.txt
which m2300w-wrapper >>./HelpMan/m2300w-wrapper.txt
whatis m2300w-wrapper >>./HelpMan/m2300w-wrapper.txt
m2300w-wrapper --help >>./HelpMan/m2300w-wrapper.txt
man m2300w-wrapper >>./HelpMan/m2300w-wrapper.txt
