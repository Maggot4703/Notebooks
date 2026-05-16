#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mkdosfs.txt
which mkdosfs >>./HelpMan/mkdosfs.txt
whatis mkdosfs >>./HelpMan/mkdosfs.txt
mkdosfs --help >>./HelpMan/mkdosfs.txt
man mkdosfs >>./HelpMan/mkdosfs.txt
