#! /bin/bash
cd /home/mark/Traveller/Netbeans/Helper/src/helper

echo '//
//
////////////////////////////////////////////////////////////////////////////////
//
//' >./HelpMan/mdeltree.txt
which mdeltree >>./HelpMan/mdeltree.txt
whatis mdeltree >>./HelpMan/mdeltree.txt
mdeltree --help >>./HelpMan/mdeltree.txt
man mdeltree >>./HelpMan/mdeltree.txt
