#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mlabel.txt
which mlabel >>./HelpMan/mlabel.txt
whatis mlabel >>./HelpMan/mlabel.txt
mlabel --help >>./HelpMan/mlabel.txt
man mlabel >>./HelpMan/mlabel.txt
