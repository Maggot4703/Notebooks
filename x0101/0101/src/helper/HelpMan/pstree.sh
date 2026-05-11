#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/pstree.txt
which pstree >>./HelpMan/pstree.txt
whatis pstree >>./HelpMan/pstree.txt
pstree --help >>./HelpMan/pstree.txt
man pstree >>./HelpMan/pstree.txt
