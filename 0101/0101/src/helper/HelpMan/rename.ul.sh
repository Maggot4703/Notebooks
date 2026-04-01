#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/rename.ul.txt
which rename.ul >>./HelpMan/rename.ul.txt
whatis rename.ul >>./HelpMan/rename.ul.txt
rename.ul --help >>./HelpMan/rename.ul.txt
man rename.ul >>./HelpMan/rename.ul.txt
